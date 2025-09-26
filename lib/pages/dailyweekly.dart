import 'package:flutter/material.dart';
import 'package:hygiene_3/task_items/task.dart';
import 'package:hygiene_3/task_items/task_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(
      () => Provider.of<TaskProvider>(context, listen: false).loadTasks(),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        bottom: TabBar(
          labelColor: Theme.of(context).colorScheme.inversePrimary,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Daily Tasks'),
            Tab(text: 'Weekly Tasks'),
          ],
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (!taskProvider.isLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildTaskList(
                taskProvider,
                TaskFrequency.daily,
              ),
              _buildTaskList(
                taskProvider,
                TaskFrequency.weekly,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTaskList(TaskProvider taskProvider, TaskFrequency frequency) {
    final tasks = taskProvider.tasks
        .where((task) => task.frequency == frequency)
        .toList();

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final originalIndex = taskProvider.tasks.indexOf(task);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: task.isCompletedToday
                ? Colors.green
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            title: Text(task.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${task.streak} 🔥',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 16),
                Checkbox(
                  value: task.isCompletedToday,
                  onChanged: (_) =>
                      taskProvider.toggleTaskCompletion(originalIndex),
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    Navigator.pushNamed(context, task.routeName);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
