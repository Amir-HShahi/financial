import 'package:financial/localization/app_localizations.dart';
import 'package:financial/service/localization_handler.dart';
import 'package:financial/view/components/customized_app_bar.dart';
import 'package:financial/view/components/customized_bottom_navigation_bar.dart';
import 'package:financial/view/components/transaction_cards.dart';
import 'package:financial/view/utility/design_colors.dart';
import 'package:financial/view/utility/scale.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      appBar: CustomizedAppBar(
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
      bottomNavigationBar: CustomizedBottomNavigationBar(),
    );
  }
}
