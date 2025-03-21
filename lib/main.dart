import 'package:financial/localization/app_localizations.dart';
import 'package:financial/service/root_jailbreak_detection.dart';
import 'package:financial/view/home.dart';
import 'package:financial/view/utility/scale.dart';
import 'package:flutter/material.dart';

void main() {
  RootJailbreakDetection.handleSecurity();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Scale.initScreenData(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Home(),
    );
  }
}
