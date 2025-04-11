import 'package:financial/presentation/widgets/profile_image_widget.dart';
import 'package:financial/presentation/widgets/profile_option_tile.dart';
import 'package:financial/presentation/widgets/rounded_background_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/localization/app_localizations.dart';
import '../../data/repositories/localization_handler.dart';
import '../../data/repositories/screenshot_handler.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../../domain/repositories/dependency_injector.dart';
import '../widgets/customized_bottom_navigation_bar.dart';
import '../widgets/sign_out_dialog.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void enableScreenshot() {
    var handler = DependencyInjector.locator<ScreenshotHandler>();
    handler.enableScreenshot();
  }

  @override
  Widget build(BuildContext context) {
    enableScreenshot();
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final fullName = 'John Restive';
    final email = 'john1234@gmail.com';

    void pushToAccountDetails() {
      Navigator.pushNamed(context, '/account_details');
    }

    void pushToChangePassword() {
      Navigator.pushNamed(context, '/change_password');
    }

    void signOutHandler() {
      showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 150),
        pageBuilder: (context, animation, secondAnimation) {
          return SignOutDialog();
        },
        transitionBuilder: (context, animation, secondAnimation, child) {
          /// adjust pop animation
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
      );
    }

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
