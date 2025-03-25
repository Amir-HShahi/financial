import 'package:financial/core/localization/app_localizations.dart';
import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:financial/service/localization_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionBottomSheet extends StatelessWidget {
  const TransactionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    void pushToAddExpense() {
      Navigator.pushNamed(context, '/add_expense');
    }

    void pushToAddIncome() {
      Navigator.pushNamed(context, '/add_income');
    }

    return Container(
      height: Scale.height(220),
      width: double.infinity,
      decoration: BoxDecoration(
        color: DesignColors.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Scale.height(32)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Scale.height(18)),
          Container(
            height: Scale.height(2),
            width: Scale.width(32),
            decoration: BoxDecoration(
              color: DesignColors.deepDarkBlue,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),

          /// add expense
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: pushToAddExpense,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Scale.height(32),
                horizontal: Scale.width(120),
              ),
              child: Text(
                locale.expense,
                style: GoogleFonts.roboto(
                  fontSize: Scale.height(16),
                  fontWeight: FontWeight.w500,
                  color: DesignColors.deepDarkBlue,
                ),
              ),
            ),
          ),

          /// divider
          Container(
            height: Scale.height(1),
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xffECECEC)),
          ),

          /// add income
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: pushToAddIncome,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Scale.height(15),
                horizontal: Scale.width(120),
              ),
              child: Text(
                locale.income,
                style: GoogleFonts.roboto(
                  fontSize: Scale.height(16),
                  fontWeight: FontWeight.w500,
                  color: DesignColors.deepDarkBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
