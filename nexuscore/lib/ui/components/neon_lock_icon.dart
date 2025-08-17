import 'package:flutter/material.dart';
import '../../app/theme.dart';

class NeonLockIcon extends StatelessWidget {
  const NeonLockIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.accent.withOpacity(0.6), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.25),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: const Icon(Icons.fingerprint, color: AppColors.accent, size: 56),
    );
  }
}