import 'package:financial/core/localization/app_localizations.dart';
import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:financial/presentation/widgets/authorization_button.dart';
import 'package:financial/presentation/widgets/authorization_title_widget.dart';
import 'package:financial/presentation/widgets/customized_button.dart';
import 'package:financial/presentation/widgets/customized_text_field.dart';
import 'package:financial/presentation/widgets/dash_hint.dart';
import 'package:financial/presentation/widgets/wave_background.dart';
import 'package:financial/service/localization_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  void signupHandler() {}

  void googleSignupHandler() {}

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = LocalizationHandler.getLocale(context);

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPassController = TextEditingController();

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
                title: locale.createAccount,
                subTitle: locale.fillInformation,
              ),
              SizedBox(height: Scale.height(32)),

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
              SizedBox(height: Scale.height(24)),

              /// password
              CustomizedTextField(
                controller: passwordController,
                title: locale.password,
                hintText: locale.password,
                toggleableVisibility: true,
              ),
              SizedBox(height: Scale.height(24)),

              /// password confirm
              CustomizedTextField(
                controller: confirmPassController,
                title: locale.passwordConfirmation,
                hintText: locale.password,
                toggleableVisibility: true,
              ),
              SizedBox(height: Scale.height(48)),

              /// sign up button
              CustomizedButton(
                onPressed: signupHandler,
                disabled: false,
                title: Text(
                  locale.signUpButton,
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
              DashHint(title: locale.orSignUpWith),
              SizedBox(height: Scale.height(32)),
              AuthorizationButton(
                onPressed: googleSignupHandler,
                child: SvgPicture.asset(
                  'assets/icons/google.svg',
                  height: Scale.height(24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
