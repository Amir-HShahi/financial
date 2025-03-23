import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:flutter/cupertino.dart';

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
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Scale.height(24),
            color: DesignColors.cyan,
          ),
        ),
        SizedBox(height: Scale.height(8)),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Scale.height(14),
            color: DesignColors.deepDarkBlue.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
