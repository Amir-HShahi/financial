import 'package:financial/service/localization_handler.dart';
import 'package:flutter/material.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/utils/design_colors.dart';
import '../../core/utils/scale.dart';
import '../widgets/customized_bottom_navigation_bar.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/transaction_cards.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
