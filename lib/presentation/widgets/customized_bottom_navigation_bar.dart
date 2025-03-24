import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/design_colors.dart';
import '../../core/utils/scale.dart';

class CustomizedBottomNavigationBar extends StatelessWidget {
  const CustomizedBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Basic blur effect
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0, // Horizontal blur amount
              sigmaY: 10.0, // Vertical blur amount
            ),
            child: Container(
              height: Scale.height(84),
              color: Colors.transparent,
              // Your content here
            ),
          ),
          Image(
            image: AssetImage('assets/images/navigation_background.png'),
            width: Scale.width(375),
          ),
          Positioned(bottom: Scale.height(44), child: _AddButton()),
          PositionedDirectional(
            start: Scale.width(48),
            bottom: Scale.height(30),
            child: SvgPicture.asset(
              'assets/icons/navigation_home_enabled.svg',
              height: Scale.height(24),
            ),
          ),
          Positioned(
            right: Scale.width(48),
            bottom: Scale.height(30),
            child: SvgPicture.asset(
              'assets/icons/navigation_profile_disabled.svg',
              height: Scale.height(24),
            ),
          ),
        ],
      ),
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
