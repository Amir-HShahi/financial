import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/presentation/widgets/customized_button.dart';
import 'package:financial/presentation/widgets/rounded_background_box.dart';
import 'package:financial/presentation/widgets/titled_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/utils/scale.dart';
import '../../service/localization_handler.dart';
import '../widgets/customized_text_field.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  void pressSaveHandler() {}

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: DesignColors.deepDarkBlue,
      appBar: TitledAppBar(title: 'Account Details'),
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
              title: Text(
                'Save Changes',
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
