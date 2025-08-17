import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';
import '../ui/components/neon_lock_icon.dart';
import '../app/theme.dart';

class BiometricGate extends ConsumerWidget {
  final Widget child;
  const BiometricGate({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    if (!auth.isUnlocked) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NeonLockIcon(),
                const SizedBox(height: 24),
                Text(
                  'NexusCore Locked',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  auth.message ?? 'Authenticate to continue',
                  style: const TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.black
                  ),
                  onPressed: () => ref.read(authProvider.notifier).checkAndAuthenticate(),
                  child: const Text('Unlock'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return child;
  }
}