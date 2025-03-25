import 'dart:ui';

import 'package:financial/core/localization/app_localizations.dart';
import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:financial/presentation/widgets/customized_button.dart';
import 'package:financial/service/localization_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({super.key});

  void signOutHandler() {}

  @override
  Widget build(BuildContext context) {
    void cancelSignOut() {
      Navigator.pop(context);
    }

    AppLocalizations locale = LocalizationHandler.getLocale(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Center(
        child: Container(
          height: Scale.height(253),
          width: Scale.width(345),
          padding: EdgeInsets.symmetric(
            vertical: Scale.height(24),
            horizontal: Scale.width(24),
          ),
          decoration: BoxDecoration(
            color: DesignColors.backgroundColor,
            borderRadius: BorderRadius.circular(Scale.height(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// message
              Text(
                locale.leavingMessage,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: Scale.height(20),
                  color: DesignColors.deepDarkBlue,
                ),
              ),
              const Spacer(),

              /// cancel
              CustomizedButton(
                onPressed: cancelSignOut,
                backgroundColor: DesignColors.royalBlue,
                child: Text(
                  locale.justKidding,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: Scale.height(16),
                    color: DesignColors.white,
                  ),
                ),
              ),
              SizedBox(height: Scale.height(16)),

              /// confirm
              CustomizedButton(
                backgroundColor: DesignColors.white,
                side: BorderSide(
                  width: Scale.height(2),
                  color: DesignColors.deepDarkBlue,
                ),
                onPressed: signOutHandler,
                child: Text(
                  locale.confirmLogout,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: Scale.height(16),
                    color: DesignColors.deepDarkBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
