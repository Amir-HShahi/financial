import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight_text/highlight_text.dart';

import '../../data/constants/localization/app_localizations.dart';
import '../../data/repositories/localization_handler.dart';
import '../../data/repositories/screenshot_handler.dart';
import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';
import '../../domain/repositories/dependency_injector.dart';
import '../widgets/authorization_button.dart';
import '../widgets/authorization_title_widget.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_text_field.dart';
import '../widgets/dash_hint.dart';
import '../widgets/wave_background.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  void loginHandler() {}

  void googleLoginHandler() {}

  void pushToSignupScreen() {}

  void disableScreenshot() {
    var handler = DependencyInjector.locator<ScreenshotHandler>();
    handler.disableScreenshot();
  }

  @override
  Widget build(BuildContext context) {
    disableScreenshot();
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: DesignColors.backgroundColor,
      body: WaveBackground(
        child: SafeArea(
          bottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Scale.height(130), width: double.infinity),
              AuthorizationTitleWidget(
                title: locale.signIn,
                subTitle: locale.welcomeBack,
              ),
              SizedBox(height: Scale.height(32)),

              /// email
              CustomizedTextField(
                controller: emailController,
                title: locale.email,
                hintText: locale.enterEmailHint,
              ),
              SizedBox(height: Scale.height(24)),

              /// password
              CustomizedTextField(
                controller: passwordController,
                title: locale.password,
                hintText: locale.password,
                toggleableVisibility: true,
              ),
              SizedBox(height: Scale.height(84)),

              /// sign in button
              CustomizedButton(
                onPressed: loginHandler,
                disabled: false,
                child: Text(
                  locale.signInButton,
                  style: GoogleFonts.poppins(
                    color: DesignColors.white,
                    height: 1,
                    fontSize: Scale.height(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: Scale.height(32)),

              /// hint
              DashHint(title: locale.orSignInWith),
              SizedBox(height: Scale.height(32)),

              /// google auth
              AuthorizationButton(
                onPressed: googleLoginHandler,
                child: SvgPicture.asset(
                  'assets/icons/google.svg',
                  height: Scale.height(24),
                ),
              ),
              SizedBox(height: Scale.height(32)),

              /// push to sign up
              _PushToSignup(onTap: pushToSignupScreen),
            ],
          ),
        ),
      ),
    );
  }
}

class _PushToSignup extends StatelessWidget {
  final Function() onTap;
  const _PushToSignup({required this.onTap});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    return TextHighlight(
      text: locale.pushToCreateAccount,
      textStyle: GoogleFonts.roboto(
        color: DesignColors.deepDarkBlue,
        fontWeight: FontWeight.w400,
        fontSize: Scale.height(14),
      ),
      words: {
        locale.signUpHighlight: HighlightedWord(
          onTap: onTap,
          textStyle: GoogleFonts.roboto(
            color: DesignColors.cyan,
            fontWeight: FontWeight.w400,
            fontSize: Scale.height(14),
          ),
        ),
      },
    );
  }
}
