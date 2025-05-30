import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/localization/app_localizations.dart';
import '../../data/repositories/localization_handler.dart';
import '../../data/repositories/screenshot_handler.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../../domain/repositories/dependency_injector.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_text_field.dart';
import '../widgets/rounded_background_box.dart';
import '../widgets/titled_app_bar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  void pressSaveHandler() {}

  void disableScreenshot() {
    var handler = DependencyInjector.locator<ScreenshotHandler>();
    handler.disableScreenshot();
  }

  @override
  Widget build(BuildContext context) {
    disableScreenshot();
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final currentPassController = TextEditingController();
    final newPassController = TextEditingController();
    final confirmPassController = TextEditingController();

    return Scaffold(
      backgroundColor: DesignColors.deepDarkBlue,
      appBar: TitledAppBar(title: locale.changePassword),
      extendBodyBehindAppBar: false,
      body: RoundedBackgroundBox(
        child: Column(
          children: [
            /// current pass
            CustomizedTextField(
              controller: currentPassController,
              title: locale.currentPassword,
              hintText: locale.password,
            ),
            SizedBox(height: Scale.height(24)),

            /// new pass
            CustomizedTextField(
              controller: newPassController,
              title: locale.newPassword,
              hintText: locale.newPassword,
            ),
            SizedBox(height: Scale.height(24)),

            /// confirm pass
            CustomizedTextField(
              controller: confirmPassController,
              title: locale.confirmPassword,
              hintText: locale.confirmPassword,
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
