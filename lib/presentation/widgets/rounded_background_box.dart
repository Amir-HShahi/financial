import 'package:flutter/cupertino.dart';

import '../../core/utils/design_colors.dart';
import '../../core/utils/scale.dart';

class RoundedBackgroundBox extends StatelessWidget {
  final Widget child;
  const RoundedBackgroundBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Scale.width(24),
        vertical: Scale.height(32),
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
