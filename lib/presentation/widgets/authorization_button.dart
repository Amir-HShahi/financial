import 'package:flutter/material.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';

class AuthorizationButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const AuthorizationButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        fixedSize: Size(Scale.height(56), Scale.height(56)),
        side: BorderSide(
          width: Scale.height(1),
          color: DesignColors.cyan.withValues(alpha: 0.3),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      child: child,
    );
  }
}
