import 'package:flutter/material.dart';
import '../../app/theme.dart';

enum Priority { low, medium, high, critical }

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final Priority priority;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.priority = Priority.medium,
    this.isCompleted = false,
  });

  Color get priorityColor {
    switch (priority) {
      case Priority.low:
        return Colors.green;
      case Priority.medium:
        return Colors.amber;
      case Priority.high:
        return Colors.orange;
      case Priority.critical:
        return AppColors.urgent;
    }
  }
}