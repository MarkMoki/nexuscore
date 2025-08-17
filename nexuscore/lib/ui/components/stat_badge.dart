import 'package:flutter/material.dart';
import '../../app/theme.dart';

class StatBadge extends StatelessWidget {
  final int count;
  final String label;
  final Color color;
  const StatBadge({super.key, required this.count, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
          shadows: [Shadow(color: color.withOpacity(0.4), blurRadius: 10)]
        )),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}