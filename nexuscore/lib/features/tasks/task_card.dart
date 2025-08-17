import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../app/theme.dart';
import 'task.dart';
import '../../ui/components/glass_card.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: ListTile(
        leading: _PriorityIndicator(priority: task.priority),
        title: Text(task.title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          task.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        trailing: Text(
          DateFormat('MMM dd').format(task.dueDate),
          style: TextStyle(
            color: task.dueDate.isBefore(DateTime.now()) 
                ? AppColors.urgent 
                : AppColors.accent
          ),
        ),
      ),
    );
  }
}

class _PriorityIndicator extends StatelessWidget {
  final Priority priority;
  const _PriorityIndicator({required this.priority});

  @override
  Widget build(BuildContext context) {
    final colors = {
      Priority.low: Colors.green,
      Priority.medium: Colors.amber,
      Priority.high: Colors.orange,
      Priority.critical: AppColors.urgent,
    };

    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: colors[priority],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colors[priority]!.withOpacity(0.7),
            blurRadius: 8,
          )
        ]
      ),
    );
  }
}