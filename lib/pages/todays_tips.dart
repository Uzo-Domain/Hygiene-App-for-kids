import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

export 'todays_tips.dart' show DailyTips;

class DailyTips extends StatefulWidget {
  const DailyTips({super.key});

  @override
  State<DailyTips> createState() => _DailyTipsState();
}

class _DailyTipsState extends State<DailyTips> {
  // List of all available messages
  final List<String> allMessages = [
    "Showering: Don't use water that's too hot! Even if it might feel nice, super-hot water can hurt your skin over time and make it dry and itchy. Stick to warm water instead.",
    "Sweeping: Shortening your strokes and applying lighter pressure with the broom will help you get more debris into your dust pan.",
    "DID YOU KNOW? Handwashing can reduce diarrheal diseases by nearly 50% and respiratory infections by 25%.",
    "DID YOU KNOW? Plaque is like sticky slime that grows on your teeth if you don't brush enough. If you skip brushing at night, that slime has a whole day to get super strong and turn into tartar—a hard, yucky crust that's really tough to clean off!",
    "DID YOU KNOW? Cold water and warm water are equally effective at killing germs and viruses — as long as you use soap and wash your hands the right way!",
    "Mopping: Sweeping before mopping will prevent your floor from becoming sticky, muddy mess as you mop.",
    "Food Hygiene: Washing raw meat or fish can spread bacteria to your sink and countertops (cross-contamination). Instead, cook it thoroughly.",
    "Face Hygiene: Don't touch your face. Avoid touching your eyes, nose and mouth.",
    "Food Hygiene: Washing foodstuffs before eating or cooking can make food taste fresher and feel better to eat.",
    "Face Hygiene: Rubbing your eyes can transfer harmful particles, causing eye infections like conjunctivitis (pink eye) or irritation.",
    "DID YOU KNOW? Mopping burns calories—it's like light exercise.",
    "Food Hygiene: Avoid Soap or Detergent. Soap is not safe for food; stick to water or food-safe cleaning sprays if needed.",
    "Food Hygiene: Wash the tops of canned goods to avoid transferring dirt or bacteria when opening them.",
    "Coughing/Sneezing: Don't cough or sneeze into your hands. Cover your mouth and nose with your elbow or tissue when coughing or sneezing. Throw away used tissue immediately.",
    "Bed Laying: It's Linked to Success. Many successful people say making their bed is part of their morning routine.",
    "Food Hygiene: Wash Before Eating, Not Before Storing. Washing food stuffs before storing can promote mold and and make it spoil faster.",
    "DID YOU KNOW? Nail Fungus is a common condition. About 10 percent of people are affected. Half of all people over age 70 develop this infection.",
    "Feet Hygiene: Fungi thrive in dark and damp environments, so people whose feet remain wet for extended periods have an increased risk of toenail fungal infections. This can happen when wearing the same sweaty shoes or boots every day or working in wet conditions.",
    "Feet Hygiene: Smelly feet and shoes can be a problem whether you're sporty or not. You can avoid this issue by giving your feet extra attention in the shower and making sure they're completely dry before putting shoes on.",
    "Showering: Warm water can improve blood flow, which may help relax muscles and ease tension.",
    "DID YOU KNOW? In some cultures, the way you hold a broom has symbolic meanings, such as chasing away bad luck.",
    "Brushing: The American Dental Association (ADA) recommends a soft-bristled brush for removing plaque and food debris. A toothbrush with a small head can better reach all areas of the mouth. An electric toothbrush is a good option for those with difficulty brushing.",
    "DID YOU KNOW? Dust mites love unmade beds. If you don't make your bed, it can become a home for dust mites that thrive in messy bedding.",
    "DID YOU KNOW? Most people spend 8 minutes in the shower, using about 17 gallons of water.",
    "Towels: Towels stop working so well at drying your body and become breeding grounds for bacteria. Replace them every 1-2 years or sooner if they smell even after washing.",
    "DID YOU KNOW? Handwashing remains one of the simplest and most effective ways to maintain good hygiene and health."
        "Washing Hands: Washing hands with soap and water is better than using alcohol-based hand sanitisers."
  ];

  List<String> todaysTips = [];
  final String prefsKey = 'message_history';

  @override
  void initState() {
    super.initState();
    _loadTodaysTips();
  }

  Future<void> _loadTodaysTips() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    final historyJson = prefs.getString(prefsKey);

    Map<String, dynamic> history = {};
    if (historyJson != null) {
      history = json.decode(historyJson);
    }

    // Clean up old entries (older than 4 days)
    final cutoffDate = DateTime.now().subtract(const Duration(days: 4));
    history.removeWhere((date, _) => DateTime.parse(date).isBefore(cutoffDate));

    // If we already have today's tips, use them
    if (history.containsKey(today)) {
      setState(() {
        todaysTips = List<String>.from(history[today]);
      });
      return;
    }

    // Get available messages (not used in last 4 days)
    final usedMessages = history.values.expand((x) => x).toSet();
    final availableMessages =
        allMessages.where((msg) => !usedMessages.contains(msg)).toList();

    // If we don't have enough available messages, reset history
    if (availableMessages.length < 3) {
      history.clear();
      availableMessages.addAll(allMessages);
    }

    // Select 3 random messages
    availableMessages.shuffle();
    final selectedMessages = availableMessages.take(3).toList();

    // Save to history
    history[today] = selectedMessages;
    await prefs.setString(prefsKey, json.encode(history));

    setState(() {
      todaysTips = selectedMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Tips"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            Column(
              children: [
                DrawerHeader(child: Image.asset("Assets/showerboy.png")),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(
                      "home",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: const Icon(Icons.checklist_rtl_rounded),
                      title: Text(
                        "tasks",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/tasks_page');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(
                      "settings",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/settings_page');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.emoji_events),
                    title: Text(
                      "achievements",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/achievements');
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: todaysTips.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: todaysTips.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(todaysTips[index]),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
