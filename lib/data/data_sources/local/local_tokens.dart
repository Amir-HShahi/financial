import 'dart:convert';

import 'package:financial/data/models/auth_token_model.dart';
import 'package:financial/domain/data_sources/local/token_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalTokens extends TokenSecureStorage {
  @override
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  String authTokenKey = 'auth_token';

  @override
  Future<void> deleteToken(AuthTokenModel token) async {
    await storage.delete(key: authTokenKey);
  }

  @override
  Future<AuthTokenModel?> readToken() async {
    final tokenJson = await storage.read(key: authTokenKey);
    if (tokenJson == null || tokenJson.isEmpty) {
      return null;
    }

    try {
      final Map<String, dynamic> jsonMap = jsonDecode(tokenJson);
      return AuthTokenModel.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> writeToken(AuthTokenModel token) async {
    final tokenJson = jsonEncode(token.toJson());
    await storage.write(key: authTokenKey, value: tokenJson);
  }

  @override
  Future<bool> hasAuthToken() async {
    final tokenJson = await storage.read(key: authTokenKey);
    return tokenJson != null && tokenJson.isNotEmpty;
  }
}
