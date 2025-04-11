import 'dart:convert';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:financial/data/data_sources/local/local_tokens.dart';
import 'package:financial/data/models/auth_token_model.dart';
import 'package:financial/domain/repositories/encryption.dart';

import '../../domain/repositories/dependency_injector.dart';

class EncryptionImpl implements Encryption {
  // A secure key should be 32 bytes (256 bits)
  late final String _secureKey;

  // IV should be 16 bytes (128 bits)
  late final String _secureIv;

  // Constructor that takes secure key and IV
  EncryptionImpl() {
    _init();
  }

  void _init() async {
    var tokens = DependencyInjector.locator<LocalTokens>();
    if (await tokens.hasAuthToken()) {
      AuthTokenModel token = tokens.readToken() as AuthTokenModel;
      _secureKey = token.secureRSAKey;
      _secureIv = token.hiveKey;
    } else {
      // Generate new secure keys if no token exists
      _secureKey = _generateRandomString(32); // 32 bytes for AES-256
      _secureIv = _generateRandomString(16); // 16 bytes for IV

      tokens.writeToken(AuthTokenModel(_secureKey, _secureIv, ""));
    }
  }

  // Helper method to generate random strings for keys
  String _generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_-+=';
    final random = Random.secure();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  // Get encrypter instance with the key
  encrypt.Encrypter _getEncrypter() {
    final key = encrypt.Key.fromUtf8(_secureKey);
    return encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
  }

  // Get IV instance
  encrypt.IV _getIV() {
    return encrypt.IV.fromUtf8(_secureIv);
  }

  @override
  Map<String, dynamic> encryptJson({required Map<String, dynamic> json}) {
    try {
      // Convert JSON to string
      final jsonString = jsonEncode(json);

      // Get encrypter and IV
      final encrypter = _getEncrypter();
      final iv = _getIV();

      // Encrypt the string
      final encrypted = encrypter.encrypt(jsonString, iv: iv);

      // Return the encrypted data in a Map
      return {'encrypted': encrypted.base64, 'iv': iv.base64};
    } catch (e) {
      // Handle encryption errors
      throw Exception('Encryption failed: $e');
    }
  }

  @override
  Map<String, dynamic> decryptJson({required Map<String, dynamic> json}) {
    try {
      // Extract encrypted data and IV
      final encryptedData = json['encrypted'] as String;
      final ivString = json['iv'] as String;

      // Get encrypter
      final encrypter = _getEncrypter();

      // Create IV from string
      final iv = encrypt.IV.fromBase64(ivString);

      // Decrypt the data
      final decrypted = encrypter.decrypt(
        encrypt.Encrypted.fromBase64(encryptedData),
        iv: iv,
      );

      // Parse the decrypted string back to JSON
      return jsonDecode(decrypted) as Map<String, dynamic>;
    } catch (e) {
      // Handle decryption errors
      throw Exception('Decryption failed: $e');
    }
  }
}
