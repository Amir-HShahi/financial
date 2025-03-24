import 'package:financial/presentation/pages/add_income.dart';
import 'package:financial/presentation/pages/profile.dart';
import 'package:financial/service/root_jailbreak_detection.dart';
import 'package:flutter/material.dart';

import 'core/localization/app_localizations.dart';
import 'core/utils/scale.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Profile(),
    );
  }
}
