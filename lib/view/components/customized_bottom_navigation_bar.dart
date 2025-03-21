import 'package:financial/view/utility/design_colors.dart';
import 'package:financial/view/utility/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomizedBottomNavigationBar extends StatelessWidget {
  const CustomizedBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset(
          'assets/images/navigation_background.svg',
          width: Scale.width(375),
        ),
        Positioned(
          bottom: Scale.height(32),
            child: _AddButton()),
        Positioned(
          left: Scale.width(32),
          bottom: Scale.height(18),
          child: SvgPicture.asset(
            'assets/icons/navigation_home_enabled.svg',
            height: Scale.height(24),
          ),
        ),
        Positioned(
          right: Scale.width(32),
          bottom: Scale.height(18),
          child: SvgPicture.asset(
            'assets/icons/navigation_profile_disabled.svg',
            height: Scale.height(24),
          ),
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Scale.height(64),
      width: Scale.height(64),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: DesignColors.deepDarkBlue,
      ),
      child: Icon(
        Icons.add_rounded,
        size: Scale.height(32),
        color: DesignColors.backgroundColor,
      ),
    );
  }
}
