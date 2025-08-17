import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task.dart';

final tasksProvider = Provider<List<Task>>((ref) {
  return [
    Task(
      id: '1',
      title: 'Complete NexusCore UI',
      description: 'Implement all tab screens',
      dueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    Task(
      id: '2',
      title: 'Implement encryption',
      description: 'Add AES-256 encryption',
      dueDate: DateTime.now().add(const Duration(days: 1)),
    ),
  ];
});