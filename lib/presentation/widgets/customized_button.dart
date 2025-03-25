import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final Function() onPressed;
  final bool disabled;
  final Widget child;
  final Color backgroundColor;
  final BorderSide? side;
  const CustomizedButton({
    super.key,
    required this.onPressed,
    this.disabled = false,
    required this.child,
    this.backgroundColor = DesignColors.deepDarkBlue,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: disabled ? DesignColors.grey : backgroundColor,
        padding: EdgeInsets.zero,
        animationDuration: Duration(milliseconds: 250),
        fixedSize: Size(Scale.width(345), Scale.height(48)),
        side: side ?? BorderSide(color: Colors.transparent, width: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
        ),
      ),
      child: child,
    );
  }
}
