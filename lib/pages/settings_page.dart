import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/notifications.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dark mode
                const Text("Dark Mode"),

                //switch toggle
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                )
              ],
            ),
          ),
          // Navigation to Notification Settings
          Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            color: Theme.of(context).colorScheme.secondary,
            child: ListTile(
              title: Text(
                'Notification Settings',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              subtitle: const Text('Manage your notification preferences'),
              trailing: const Icon(Icons.notifications),
              onTap: () {
                Navigator.pushNamed(context, '/notification-settings');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  Map<NotificationType, TimeOfDay> notificationTimes = {};

  @override
  void initState() {
    super.initState();
    loadSavedTimes();
  }

  Future<void> loadSavedTimes() async {
    for (var config in NotificationService.notifications) {
      final time = await NotificationService.getNotificationTime(config.type);
      setState(() {
        notificationTimes[config.type] = time;
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, NotificationConfig config) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: notificationTimes[config.type] ?? config.defaultTime,
    );

    if (picked != null) {
      setState(() {
        notificationTimes[config.type] = picked;
      });
      await NotificationService.saveNotificationTime(config.type, picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dailyNotifications = NotificationService.notifications
        .where((n) => n.frequency == 'daily')
        .toList();
    final weeklyNotifications = NotificationService.notifications
        .where((n) => n.frequency == 'weekly')
        .toList();
    final quarterlyNotifications = NotificationService.notifications
        .where((n) => n.frequency == 'quarterly')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSection('Daily Reminders', dailyNotifications),
          const SizedBox(height: 24),
          _buildSection('Weekly Reminders', weeklyNotifications),
          const SizedBox(height: 24),
          _buildSection('Quarterly Reminders', quarterlyNotifications),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<NotificationConfig> configs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...configs.map((config) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildNotificationSetting(config),
            )),
      ],
    );
  }

  Widget _buildNotificationSetting(NotificationConfig config) {
    final time = notificationTimes[config.type] ?? config.defaultTime;

    return Card(
      child: ListTile(
        title: Text(config.title),
        subtitle: Text('Set for ${time.format(context)}'),
        trailing: IconButton(
          icon: const Icon(Icons.access_time),
          onPressed: () => _selectTime(context, config),
        ),
      ),
    );
  }
}
