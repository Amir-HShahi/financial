import 'package:financial/core/localization/app_localizations.dart';
import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:financial/presentation/widgets/profile_image_widget.dart';
import 'package:financial/presentation/widgets/profile_option_tile.dart';
import 'package:financial/presentation/widgets/rounded_background_box.dart';
import 'package:financial/service/localization_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/customized_bottom_navigation_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final fullName = 'John Restive';
    final email = 'john1234@gmail.com';

    void pushToAccountDetails() {
      Navigator.pushNamed(context, '/account_details');
    }

    void pushToChangePassword() {
      Navigator.pushNamed(context, '/change_password');
    }
    void signOutHandler() {}

    return Scaffold(
      backgroundColor: DesignColors.deepDarkBlue,
      bottomNavigationBar: CustomizedBottomNavigationBar(
        state: NavigationCurrentState.profile,
      ),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            /// option tiles
            Padding(
              padding: EdgeInsets.only(top: Scale.height(200)),
              child: RoundedBackgroundBox(
                child: Column(
                  children: [
                    SizedBox(height: Scale.height(56)),
                    ProfileOptionTile(
                      onTap: pushToAccountDetails,
                      leadingIconPath: 'assets/icons/leading_profile.svg',
                      title: locale.accountDetails,
                    ),
                    SizedBox(height: Scale.height(24)),
                    ProfileOptionTile(
                      onTap: pushToChangePassword,
                      leadingIconPath: 'assets/icons/leading_password.svg',
                      title: locale.changePassword,
                    ),
                    SizedBox(height: Scale.height(24)),
                    ProfileOptionTile(
                      onTap: signOutHandler,
                      leadingIconPath: 'assets/icons/leading_sign_out.svg',
                      title: locale.signOut,
                    ),
                  ],
                ),
              ),
            ),

            /// name, email, profile image
            Column(
              children: [
                SizedBox(height: Scale.height(56), width: double.infinity),

                /// name
                Text(
                  fullName,
                  style: GoogleFonts.montserrat(
                    fontSize: Scale.height(24),
                    fontWeight: FontWeight.w700,
                    color: DesignColors.white,
                  ),
                ),
                SizedBox(height: Scale.height(8)),

                /// email
                Text(
                  email,
                  style: GoogleFonts.montserrat(
                    fontSize: Scale.height(12),
                    fontWeight: FontWeight.w400,
                    color: DesignColors.white,
                  ),
                ),
                SizedBox(height: Scale.height(18)),

                /// profile image
                ProfileImageWidget(size: Scale.height(120)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
