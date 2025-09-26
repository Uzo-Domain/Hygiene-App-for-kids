import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hygiene_3/task_items/task.dart';

class AchievementsPage extends StatefulWidget {
  final List<Task> tasks;

  const AchievementsPage({super.key, required this.tasks});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  Map<String, bool> achievements = {};
  final List<int> streakMilestones = [
    50,
    100,
    150,
    200,
    250,
    300,
    350,
    400,
    450,
    500,
    550,
    600,
    650,
    700,
    750,
    800,
    850,
    900,
    950,
    1000
  ];

  @override
  void initState() {
    super.initState();
    loadAchievements();
  }

  Future<void> loadAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Daily completion achievements
      achievements['daily_completion'] =
          prefs.getBool('achievement_daily_completion') ?? false;
      achievements['weekly_completion'] =
          prefs.getBool('achievement_weekly_completion') ?? false;

      // Streak achievements
      for (var milestone in streakMilestones) {
        achievements['daily_streak_$milestone'] =
            prefs.getBool('achievement_daily_streak_$milestone') ?? false;
        achievements['weekly_streak_$milestone'] =
            prefs.getBool('achievement_weekly_streak_$milestone') ?? false;
      }
    });
  }

  Future<void> updateAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    bool allDailyTasksCompleted = true;
    bool allWeeklyTasksCompleted = true;
    int maxDailyStreak = 0;
    int maxWeeklyStreak = 0;

    // Check daily and weekly task completion
    for (var task in widget.tasks) {
      if (task.frequency == TaskFrequency.daily) {
        if (!task.isCompletedToday) allDailyTasksCompleted = false;
        if (task.streak > maxDailyStreak) maxDailyStreak = task.streak;
      } else {
        if (!task.isCompletedToday) allWeeklyTasksCompleted = false;
        if (task.streak > maxWeeklyStreak) maxWeeklyStreak = task.streak;
      }
    }

    // Update daily completion achievement
    if (allDailyTasksCompleted) {
      achievements['daily_completion'] = true;
      await prefs.setBool('achievement_daily_completion', true);
    }

    // Update weekly completion achievement
    if (allWeeklyTasksCompleted) {
      achievements['weekly_completion'] = true;
      await prefs.setBool('achievement_weekly_completion', true);
    }

    // Update streak achievements
    for (var milestone in streakMilestones) {
      if (maxDailyStreak >= milestone) {
        achievements['daily_streak_$milestone'] = true;
        await prefs.setBool('achievement_daily_streak_$milestone', true);
      }
      if (maxWeeklyStreak >= milestone) {
        achievements['weekly_streak_$milestone'] = true;
        await prefs.setBool('achievement_weekly_streak_$milestone', true);
      }
    }

    setState(() {});
  }

  Widget buildAchievementBox(String title, bool isAchieved) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isAchieved ? Colors.green[100] : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isAchieved ? Colors.green : Colors.grey,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAchieved ? Icons.emoji_events : Icons.emoji_events_outlined,
            color: isAchieved ? Colors.green : Colors.grey,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isAchieved ? Colors.green[900] : Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("Assets/brushing.png"),
          fit: BoxFit.cover,
        )),
        child: FutureBuilder(
          future: updateAchievements(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.8), // semi-transparent white
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Daily Achievements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      buildAchievementBox(
                        'Complete all\ndaily tasks',
                        achievements['daily_completion'] ?? false,
                      ),
                      ...streakMilestones
                          .map((milestone) => buildAchievementBox(
                                '$milestone days\nstreak',
                                achievements['daily_streak_$milestone'] ??
                                    false,
                              )),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.8), // semi-transparent white
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Weekly Achievements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      buildAchievementBox(
                        'Complete all\nweekly tasks',
                        achievements['weekly_completion'] ?? false,
                      ),
                      ...streakMilestones
                          .map((milestone) => buildAchievementBox(
                                '$milestone weeks\nstreak',
                                achievements['weekly_streak_$milestone'] ??
                                    false,
                              )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
