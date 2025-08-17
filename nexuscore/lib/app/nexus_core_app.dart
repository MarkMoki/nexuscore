import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'initialization/init_provider.dart';
import '../auth/biometric_gate.dart';
import '../ui/screens/home_shell.dart';
import '../ui/screens/splash_screen.dart';
import '../ui/screens/error_screen.dart';
import 'theme.dart';

class NexusCoreApp extends ConsumerWidget {
  const NexusCoreApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(initProvider);
    return MaterialApp(
      title: 'NexusCore',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: init.when(
        data: (_) => const BiometricGate(child: HomeShell()),
        loading: () => const SplashScreen(),
        error: (e, st) => ErrorScreen(message: 'Initialization error: $e'),
      ),
    );
  }
}