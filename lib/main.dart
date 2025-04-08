import 'package:financial/data/repositories/root_jailbreak_detection.dart';
import 'package:financial/presentation/pages/home.dart';
import 'package:flutter/material.dart';

import 'data/constants/localization/app_localizations.dart';
import 'data/utils/app_routes.dart';
import 'data/utils/scale.dart';

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
      routes: AppRoutes.routes,
      home: Home(),
    );
  }
}
