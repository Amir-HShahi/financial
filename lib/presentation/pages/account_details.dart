import 'package:financial/data/repositories/screenshot_handler.dart';
import 'package:financial/domain/repositories/dependency_injector.dart';
import 'package:financial/presentation/widgets/customized_button.dart';
import 'package:financial/presentation/widgets/rounded_background_box.dart';
import 'package:financial/presentation/widgets/titled_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/localization/app_localizations.dart';
import '../../data/repositories/localization_handler.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../widgets/customized_text_field.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  void pressSaveHandler() {}

  void disableScreenshot() {
    var handler = DependencyInjector.locator<ScreenshotHandler>();
    handler.disableScreenshot();
  }

  @override
  Widget build(BuildContext context) {
    disableScreenshot();
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: DesignColors.deepDarkBlue,
      appBar: TitledAppBar(title: locale.accountDetails),
      extendBodyBehindAppBar: false,
      body: RoundedBackgroundBox(
        child: Column(
          children: [
            /// full name
            CustomizedTextField(
              controller: nameController,
              title: locale.fullName,
              hintText: '',
            ),
            SizedBox(height: Scale.height(24)),

            /// email
            CustomizedTextField(
              controller: emailController,
              title: locale.email,
              hintText: locale.enterEmailHint,
            ),
            const Spacer(),

            /// save button
            CustomizedButton(
              onPressed: pressSaveHandler,
              child: Text(
                locale.saveChanges,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: Scale.height(16),
                  color: DesignColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
