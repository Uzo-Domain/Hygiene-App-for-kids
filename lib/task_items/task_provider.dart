import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks;
  bool _isLoaded = false;

  TaskProvider(this._tasks);

  List<Task> get tasks => _tasks;
  bool get isLoaded => _isLoaded;

  Future<void> loadTasks() async {
    if (_isLoaded) return;

    final prefs = await SharedPreferences.getInstance();

    for (var task in _tasks) {
      final taskKey = 'task_${task.name.replaceAll(' ', '_')}';
      task.streak = prefs.getInt('${taskKey}_streak') ?? 0;
      final lastCompletedStr = prefs.getString('${taskKey}_lastCompleted');
      task.lastCompleted =
          lastCompletedStr != null ? DateTime.parse(lastCompletedStr) : null;
      task.isCompletedToday =
          prefs.getBool('${taskKey}_isCompletedToday') ?? false;

      if (task.lastCompleted != null) {
        final today = DateTime.now();
        final lastCompletedDate = DateTime(
          task.lastCompleted!.year,
          task.lastCompleted!.month,
          task.lastCompleted!.day,
        );
        final currentDate = DateTime(today.year, today.month, today.day);

        if (lastCompletedDate.isBefore(currentDate)) {
          task.isCompletedToday = false;
        }
      }
    }

    _isLoaded = true;
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(int taskIndex) async {
    final task = _tasks[taskIndex];
    final now = DateTime.now();

    if (!task.isCompletedToday) {
      if (task.lastCompleted != null) {
        if (task.frequency == TaskFrequency.daily) {
          final yesterday = DateTime(now.year, now.month, now.day - 1);
          final lastCompletedDate = DateTime(
            task.lastCompleted!.year,
            task.lastCompleted!.month,
            task.lastCompleted!.day,
          );

          if (lastCompletedDate.isAtSameMomentAs(yesterday)) {
            task.streak++;
          } else if (lastCompletedDate.isBefore(yesterday)) {
            task.streak = 1;
          }
        } else {
          // Weekly frequency
          final lastWeek = DateTime(now.year, now.month, now.day - 7);
          final lastCompletedDate = DateTime(
            task.lastCompleted!.year,
            task.lastCompleted!.month,
            task.lastCompleted!.day,
          );

          if (!lastCompletedDate.isBefore(lastWeek)) {
            task.streak++;
          } else {
            task.streak = 1;
          }
        }
      } else {
        task.streak = 1;
      }

      task.lastCompleted = now;
      task.isCompletedToday = true;
    } else {
      task.isCompletedToday = false;
      if (task.streak > 0) task.streak--;
    }

    await _saveTasks();
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();

    for (var task in _tasks) {
      final taskKey = 'task_${task.name.replaceAll(' ', '_')}';
      await prefs.setInt('${taskKey}_streak', task.streak);
      await prefs.setString('${taskKey}_lastCompleted',
          task.lastCompleted?.toIso8601String() ?? '');
      await prefs.setBool('${taskKey}_isCompletedToday', task.isCompletedToday);
    }
  }
}
