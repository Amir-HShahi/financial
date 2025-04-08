import 'package:local_auth/local_auth.dart';

abstract class LocalAuth {
  abstract LocalAuthentication auth;

  Future<bool> authenticate();

  Future<void> cancelAuthentication();
}
