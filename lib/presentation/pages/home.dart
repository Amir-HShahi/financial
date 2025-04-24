import 'package:flutter/material.dart';

import '../../data/constants/localization/app_localizations.dart';
import '../../data/repositories/localization_handler.dart';
import '../../data/repositories/screenshot_handler.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../../domain/repositories/dependency_injector.dart';
import '../widgets/customized_bottom_navigation_bar.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/transaction_cards.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void enableScreenshot() {
    var handler = DependencyInjector.locator<ScreenshotHandler>();
    handler.enableScreenshot();
  }

  @override
  Widget build(BuildContext context) {
    enableScreenshot();
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      appBar: HomeAppBar(
        sayHello: locale.sayHello("John"),
        haveANiceDay: locale.haveANiceDay,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: Scale.width(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Scale.height(70), width: double.infinity),
            TransactionCards(),
          ],
        ),
      ),
      bottomNavigationBar: CustomizedBottomNavigationBar(
        state: NavigationCurrentState.home,
      ),
    );
  }
}
