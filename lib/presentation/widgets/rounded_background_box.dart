import 'package:flutter/cupertino.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';


class RoundedBackgroundBox extends StatelessWidget {
  final Widget child;
  const RoundedBackgroundBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
        left: Scale.width(24),
        right: Scale.width(24),
        top: Scale.height(40),
        bottom: Scale.height(32),
      ),
      decoration: BoxDecoration(
        color: DesignColors.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Scale.height(32)),
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
