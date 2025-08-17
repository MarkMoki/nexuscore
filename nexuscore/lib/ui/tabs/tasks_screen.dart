import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexusc0re/app/theme.dart';
import 'package:nexusc0re/features/tasks/task.dart';
import 'package:nexusc0re/features/tasks/task_card.dart';
import 'package:nexusc0re/features/tasks/tasks_provider.dart';
import 'package:nexusc0re/ui/components/glass_card.dart';
import 'package:nexusc0re/ui/components/stat_badge.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    return Column(
      children: [
        _buildStatsHeader(tasks),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskCard(task: tasks[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsHeader(List<Task> tasks) {
    final completed = tasks.where((t) => t.isCompleted).length;
    final critical = tasks.where((t) => t.priority == Priority.critical).length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: const Border(bottom: BorderSide(color: Colors.white24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatBadge(count: tasks.length, label: 'Total', color: Colors.blue),
          StatBadge(count: completed, label: 'Done', color: Colors.green),
          StatBadge(count: critical, label: 'Critical', color: AppColors.urgent),
        ],
      ),
    );
  }
}