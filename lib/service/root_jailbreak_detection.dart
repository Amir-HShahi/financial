import 'dart:io';

import 'package:flutter/services.dart';
import 'package:root_jailbreak_sniffer/rjsniffer.dart';

abstract class RootJailbreakDetection {
  static Future<bool> checkRootJailbreak() async {
    bool amICompromised = await Rjsniffer.amICompromised() ?? true;
    return amICompromised;
  }

  static Future<bool> checkEmulator() async {
    bool amIEmulator = await Rjsniffer.amIEmulator() ?? false;
    return amIEmulator;
  }

  static Future<bool> checkDebugging() async {
    bool amIDebugging = await Rjsniffer.amIDebugged() ?? false;
    return amIDebugging;
  }

  static void handleSecurity() async {
    bool emulator = await checkEmulator();
    bool rootJailbreak = await checkRootJailbreak();
    bool debugging = await checkDebugging();
    if (rootJailbreak) {
      SystemNavigator.pop();
      exit(0);
    }
  }
}
