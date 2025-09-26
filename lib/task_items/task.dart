enum TaskFrequency { daily, weekly }

class Task {
  final String name;
  final TaskFrequency frequency;
  final String routeName;
  int streak;
  DateTime? lastCompleted;
  bool isCompletedToday;

  Task({
    required this.name,
    required this.frequency,
    required this.routeName,
    this.streak = 0,
    this.lastCompleted,
    this.isCompletedToday = false,
  });
}
