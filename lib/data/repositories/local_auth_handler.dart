import 'package:financial/domain/repositories/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthHandler implements LocalAuth {
  @override
  LocalAuthentication auth = LocalAuthentication();

  @override
  Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'verify that it is yourself',
        options: const AuthenticationOptions(stickyAuth: true),
      );
      return authenticated;
    } on PlatformException {
      return authenticated;
    }
  }

  @override
  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }
}
