import 'package:flutter/material.dart';
import 'package:hygiene_3/pages/achievements.dart';
import 'package:hygiene_3/pages/brushing.dart';
import 'package:hygiene_3/pages/dailyweekly.dart';
import 'package:hygiene_3/pages/lay_bed.dart';
import 'package:hygiene_3/pages/mopping.dart';
import 'package:hygiene_3/pages/nail_trim.dart';
import 'package:hygiene_3/pages/settings_page.dart';
import 'package:hygiene_3/pages/sheet_laundry.dart';
import 'package:hygiene_3/pages/shower.dart';
import 'package:hygiene_3/pages/sweeping.dart';
import 'package:hygiene_3/pages/todays_tips.dart';
import 'package:hygiene_3/task_items/notifications.dart';
import 'package:hygiene_3/task_items/task.dart';
import 'package:hygiene_3/task_items/task_provider.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initializeNotifications();

  final tasks = [
    // Add your tasks here with their routes
    Task(
      name: 'Morning brush',
      frequency: TaskFrequency.daily,
      routeName: '/brushing-page',
    ),
    Task(
      name: 'Sweep the floors',
      frequency: TaskFrequency.weekly,
      routeName: '/sweeping',
    ),
    Task(
      name: 'Mop the floors',
      frequency: TaskFrequency.weekly,
      routeName: '/mopping',
    ),
    Task(
      name: 'Change bed sheets, pillowcases, and towels',
      frequency: TaskFrequency.weekly,
      routeName: '/change-sheets',
    ),
    Task(
      name: 'Trim your fingernails and Toenails',
      frequency: TaskFrequency.weekly,
      routeName: '/nail-trim',
    ),
    Task(
      name: 'Evening brush',
      frequency: TaskFrequency.daily,
      routeName: '/brushing-page',
    ),
    Task(
      name: 'Shower',
      frequency: TaskFrequency.daily,
      routeName: '/shower',
    ),
    Task(
      name: 'Lay your bed',
      frequency: TaskFrequency.daily,
      routeName: '/bed-making',
    ),
  ];

  runApp(MyApp(tasks: tasks));
}

class MyApp extends StatelessWidget {
  final List<Task> tasks;

  const MyApp({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider(tasks)),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: 'Daily Tasks',
            theme: Provider.of<ThemeProvider>(context).themeData,
            home: const DailyTips(),
            routes: {
              '/brushing-page': (context) => const BrushingPage(),
              '/tasks_page': (context) => const HomePage(),
              '/settings_page': (context) => const SettingsPage(),
              '/shower': (context) => const Showering(),
              '/mopping': (context) => const Mopping(),
              '/sweeping': (context) => const Sweeping(),
              '/bed-making': (context) => const BedMaking(),
              '/nail-trim': (context) => const NailTrim(),
              '/change-sheets': (context) => const SheetsLaundry(),
              '/notification-settings': (context) =>
                  const NotificationSettingsPage(),
              '/achievements': (context) => AchievementsPage(
                  tasks: Provider.of<TaskProvider>(context).tasks),
            },
          );
        },
      ),
    );
  }
}
