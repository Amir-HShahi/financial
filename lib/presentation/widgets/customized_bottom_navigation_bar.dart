import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/design_colors.dart';
import '../../core/utils/scale.dart';

enum NavigationCurrentState { home, profile }

class CustomizedBottomNavigationBar extends StatelessWidget {
  final NavigationCurrentState state;
  const CustomizedBottomNavigationBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    void pushToHomeScreen() {
      if (state == NavigationCurrentState.profile) {
        Navigator.pushNamed(context, '/home');
      }
    }

    void pushToProfileScreen() {
      if (state == NavigationCurrentState.home) {
        Navigator.pushNamed(context, '/profile');
      }
    }

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
            child: GestureDetector(
              onTap: pushToHomeScreen,
              child: SvgPicture.asset(
                state == NavigationCurrentState.home
                    ? 'assets/icons/navigation_home_enabled.svg'
                    : 'assets/icons/navigation_home_disabled.svg',
                height: Scale.height(24),
              ),
            ),
          ),
          Positioned(
            right: Scale.width(48),
            bottom: Scale.height(30),
            child: GestureDetector(
              onTap: pushToProfileScreen,
              child: SvgPicture.asset(
                state == NavigationCurrentState.profile
                    ? 'assets/icons/navigation_profile_enabled.svg'
                    : 'assets/icons/navigation_profile_disabled.svg',
                height: Scale.height(24),
              ),
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
