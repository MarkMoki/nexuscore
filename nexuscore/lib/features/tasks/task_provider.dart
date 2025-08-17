import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task.dart';

final tasksProvider = Provider<List<Task>>((ref) {
  return [
    Task(
      id: '1',
      title: 'Complete NexusCore UI',
      description: 'Implement all tab screens with cyberpunk design',
      dueDate: DateTime.now().add(const Duration(days: 2)),
      priority: Priority.high,
    ),
    Task(
      id: '2',
      title: 'Implement Hive encryption',
      description: 'Secure storage for tasks and notes',
      dueDate: DateTime.now().add(const Duration(days: 1)),
      priority: Priority.critical,
    ),
    Task(
      id: '3',
      title: 'Test backup functionality',
      description: 'Verify encrypted exports work offline',
      dueDate: DateTime.now().add(const Duration(days: 3)),
    ),
  ];
});