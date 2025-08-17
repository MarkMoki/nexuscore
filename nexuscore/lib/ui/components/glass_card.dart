import 'package:flutter/material.dart';
import '../../app/theme.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.margin,
    this.borderRadius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.08),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}