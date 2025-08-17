import 'package:flutter/material.dart';
import '../../app/theme.dart';

class NeonLoader extends StatefulWidget {
  const NeonLoader({super.key});

  @override
  State<NeonLoader> createState() => _NeonLoaderState();
}

class _NeonLoaderState extends State<NeonLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        final glow = 4 + 8 * _ctrl.value;
        return Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(0.7),
                blurRadius: glow,
                spreadRadius: 1,
              ),
            ],
            border: Border.all(color: AppColors.accent, width: 2),
          ),
          child: const Center(
            child: Icon(Icons.lock, color: Colors.white70),
          ),
        );
      },
    );
  }
}