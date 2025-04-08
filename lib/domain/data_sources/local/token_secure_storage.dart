import 'package:financial/data/models/auth_token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenSecureStorage {
  abstract FlutterSecureStorage storage;
  abstract String authTokenKey;

  Future<AuthTokenModel?> readToken();

  Future<void> writeToken(AuthTokenModel token);

  Future<void> deleteToken(AuthTokenModel token);

  Future<bool> hasAuthToken();
}
