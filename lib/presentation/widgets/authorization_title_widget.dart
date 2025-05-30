import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';

class AuthorizationTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthorizationTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: Scale.height(24),
            color: DesignColors.cyan,
          ),
        ),
        SizedBox(height: Scale.height(8)),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: Scale.height(14),
            color: DesignColors.deepDarkBlue.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
