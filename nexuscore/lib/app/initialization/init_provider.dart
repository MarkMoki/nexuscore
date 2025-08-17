import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'secure_key_manager.dart';

final initProvider = FutureProvider<InitializationResult>((ref) async {
  await Hive.initFlutter();
  final keyManager = SecureKeyManager();
  final key = await keyManager.getOrCreateKey();
  final baseBox = await Hive.openBox(
    'nexuscore_app',
    encryptionCipher: HiveAesCipher(key),
  );
  return InitializationResult(baseBox: baseBox, hiveKey: key);
});

class InitializationResult {
  final Box baseBox;
  final Uint8List hiveKey;
  InitializationResult({required this.baseBox, required this.hiveKey});
}