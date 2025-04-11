import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:financial/domain/repositories/encryption.dart';

class EncryptionImpl implements Encryption {
  // A secure key should be 32 bytes (256 bits)
  final String _secureKey;

  // IV should be 16 bytes (128 bits)
  final String _secureIv;

  // Constructor that takes secure key and IV
  EncryptionImpl({
    required String secureKey,
    required String secureIv,
  })  : _secureKey = secureKey,
        _secureIv = secureIv;

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
      return {
        'encrypted': encrypted.base64,
        'iv': iv.base64,
      };
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