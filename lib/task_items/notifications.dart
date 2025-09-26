import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum to identify different notification types
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

enum NotificationType {
  morningHygiene,
  eveningHygiene,
  weeklyGrooming,
  weeklyCleanup,
  quarterlyDeepClean,
  quarterlySupplies
}

class NotificationConfig {
  final String title;
  final String body;
  final TimeOfDay defaultTime;
  final String routeName;
  final NotificationType type;
  final String frequency;

  NotificationConfig({
    required this.title,
    required this.body,
    required this.defaultTime,
    required this.routeName,
    required this.type,
    required this.frequency,
  });
}

class NotificationService {
  static final List<NotificationConfig> notifications = [
    NotificationConfig(
      type: NotificationType.morningHygiene,
      title: 'Morning Routine',
      body: 'Have you brushed and showered this morning?',
      defaultTime: const TimeOfDay(hour: 7, minute: 0),
      routeName: '/brushing-page',
      frequency: 'daily',
    ),
    NotificationConfig(
      type: NotificationType.morningHygiene,
      title: 'Lay Your Bed',
      body: 'Make your bed before starting the main activities for the day',
      defaultTime: const TimeOfDay(hour: 8, minute: 0),
      routeName: '/bed-making',
      frequency: 'daily',
    ),
    NotificationConfig(
      type: NotificationType.eveningHygiene,
      title: 'Evening Brush',
      body: "Don't forget to brush your teeth before bed!",
      defaultTime: const TimeOfDay(hour: 21, minute: 0),
      routeName: '/brushing-page',
      frequency: 'daily',
    ),
    NotificationConfig(
      type: NotificationType.weeklyGrooming,
      title: 'Trim Your Nails',
      body: 'Cut your nails to avoid them getting too sharp or breaking',
      defaultTime: const TimeOfDay(hour: 10, minute: 0),
      routeName: '/nail-trim',
      frequency: 'weekly',
    ),
    NotificationConfig(
      type: NotificationType.weeklyCleanup,
      title: 'Sweep and Mop',
      body: 'Sweep and mop your floors to prevent allergies!',
      defaultTime: const TimeOfDay(hour: 14, minute: 0),
      routeName: '/sweeping',
      frequency: 'weekly',
    ),
    NotificationConfig(
      type: NotificationType.weeklyCleanup,
      title: 'Change Sheets and Towels',
      body:
          'Change your bed sheets, pillowcases and towels to clean ones and wash the ones that are dirty.',
      defaultTime: const TimeOfDay(hour: 12, minute: 0),
      routeName: '/change-sheets',
      frequency: 'weekly',
    ),
    NotificationConfig(
      type: NotificationType.quarterlyDeepClean,
      title: 'Change Duvet and Blankets',
      body:
          'Switch your duvet or blanket to a clean one and wash the dirty ones.',
      defaultTime: const TimeOfDay(hour: 9, minute: 0),
      routeName: '/change-sheets',
      frequency: 'quarterly',
    ),
  ];

  static Future<void> initializeNotifications() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'hygiene_reminders',
          channelName: 'Hygiene Reminders',
          channelDescription: 'Notifications for hygiene reminders',
          defaultColor: Colors.blue,
          importance: NotificationImportance.High,
        ),
      ],
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (navigatorKey.currentContext != null) {
      final routeName = receivedAction.payload?['route'];
      if (routeName != null) {
        Navigator.of(navigatorKey.currentContext!).pushNamed(routeName);
      }
    }
  }

  static Future<TimeOfDay> getNotificationTime(NotificationType type) async {
    final prefs = await SharedPreferences.getInstance();
    final savedTime = prefs.getString(type.toString());
    if (savedTime == null) {
      final defaultConfig =
          notifications.firstWhere((config) => config.type == type);
      return defaultConfig.defaultTime;
    }
    final parts = savedTime.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static Future<void> saveNotificationTime(
      NotificationType type, TimeOfDay time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(type.toString(), '${time.hour}:${time.minute}');
    await scheduleAllNotifications();
  }

  static Future<void> scheduleNotification(
      NotificationConfig config, TimeOfDay time) async {
    final notificationContent = NotificationContent(
      id: config.type.index,
      channelKey: 'hygiene_reminders',
      title: config.title,
      body: config.body,
      payload: {'route': config.routeName},
      notificationLayout: NotificationLayout.Default,
    );

    NotificationCalendar schedule;

    switch (config.frequency) {
      case 'daily':
        schedule = NotificationCalendar(
          hour: time.hour,
          minute: time.minute,
          repeats: true,
        );
        break;
      case 'weekly':
        schedule = NotificationCalendar(
          hour: time.hour,
          minute: time.minute,
          weekday: DateTime.saturday,
          repeats: true,
        );
        break;
      case 'quarterly':
        final now = DateTime.now();
        schedule = NotificationCalendar(
          hour: time.hour,
          minute: time.minute,
          day: 1,
          month: ((now.month - 1 + 3) % 12) + 1,
          repeats: true,
        );
        break;
      default:
        throw Exception('Invalid frequency');
    }

    await AwesomeNotifications().createNotification(
      content: notificationContent,
      schedule: schedule,
    );
  }

  static Future<void> scheduleAllNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();

    for (var config in notifications) {
      final time = await getNotificationTime(config.type);
      await scheduleNotification(config, time);
    }
  }
}
