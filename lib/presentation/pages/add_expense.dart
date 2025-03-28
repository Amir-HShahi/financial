import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/localization/app_localizations.dart';
import '../../data/repositories/localization_handler.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_text_field.dart';
import '../widgets/rounded_background_box.dart';
import '../widgets/titled_app_bar.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  void pressAddHandler() {}

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final amountController = TextEditingController();
    final reasonController = TextEditingController();

    return Scaffold(
      backgroundColor: DesignColors.deepDarkBlue,
      appBar: TitledAppBar(title: locale.addExpense),
      extendBodyBehindAppBar: false,
      body: RoundedBackgroundBox(
        child: Column(
          children: [
            /// spent amount
            CustomizedTextField(
              controller: amountController,
              title: locale.howMuchSpent,
              hintText: '',
            ),
            SizedBox(height: Scale.height(24)),

            /// reason
            CustomizedTextField(
              controller: reasonController,
              title: locale.forWhat,
              hintText: '',
            ),
            SizedBox(height: Scale.height(32)),

            const Spacer(),

            /// add button
            CustomizedButton(
              onPressed: pressAddHandler,
              child: Text(
                locale.add,
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
