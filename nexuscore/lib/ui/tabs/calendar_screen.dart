import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../features/tasks/task.dart';
import '../../features/tasks/tasks_provider.dart';
import '../../utils/date_utils.dart';
import '../components/glass_card.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    return Column(
      children: [
        _buildCalendarHeader(),
        Expanded(child: _buildCalendarView(tasks)),
      ],
    );
  }

  Widget _buildCalendarHeader() {
    return GlassCard(
      margin: EdgeInsets.zero,
      borderRadius: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white70),
              onPressed: () {},
            ),
            Text(
              DateFormat('MMMM yyyy').format(DateTime.now()),
              style: const TextStyle(color: Colors.white, fontSize: 18)),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white70),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarView(List<Task> tasks) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        final date = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).add(Duration(days: index));
        final dayTasks = tasks.where((t) => isSameDay(t.dueDate, date)).toList();
        return _CalendarDayCell(date: date, taskCount: dayTasks.length);
      },
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  final DateTime date;
  final int taskCount;
  const _CalendarDayCell({required this.date, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    final isToday = isSameDay(date, DateTime.now());
    final isCurrentMonth = date.month == DateTime.now().month;

    return Container(
      decoration: BoxDecoration(
        color: isToday ? AppColors.accent.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isToday ? AppColors.accent : Colors.transparent,
          width: 1.5
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(
                color: isCurrentMonth ? Colors.white : Colors.white54,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal
              ),
            ),
          ),
          if (taskCount > 0)
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.urgent,
                  shape: BoxShape.circle
                ),
                child: Text('$taskCount', style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                )),
              ),
            )
        ],
      ),
    );
  }
}