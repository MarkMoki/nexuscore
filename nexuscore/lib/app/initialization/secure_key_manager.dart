import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureKeyManager {
  static const _keyName = 'nexuscore_hive_key_v1';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Uint8List> getOrCreateKey() async {
    final existing = await _storage.read(key: _keyName);
    if (existing != null) {
      return base64Decode(existing);
    }
    final key = _generateSecureKey(32);
    await _storage.write(key: _keyName, value: base64Encode(key));
    return key;
  }

  Uint8List _generateSecureKey(int length) {
    final random = Random.secure();
    final bytes = List<int>.generate(length, (_) => random.nextInt(256));
    return Uint8List.fromList(bytes);
  }
}