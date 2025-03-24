import 'package:flutter/material.dart';

import '../../core/utils/design_colors.dart';
import '../../core/utils/scale.dart';

/// A widget that displays a circular profile image surrounded by a border.
/// Currently, the profile image is represented by a red placeholder. todo
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Setting the height and width of the outer circle
      height: Scale.height(64),
      width: Scale.height(64),
      padding: EdgeInsets.all(Scale.height(2)),
      decoration: BoxDecoration(
        // Circular shape with a custom border
        shape: BoxShape.circle,
        border: Border.all(
          color: DesignColors.deepDarkBlue, // Color of the border
          width: Scale.height(1), // Border thickness
        ),
      ),
      // Clip the content inside a circular boundary
      child: ClipOval(
        child: Container(
          // Placeholder for the profile image (currently a red circle)
          color: Colors.red,
          height: Scale.height(30), // Placeholder's height
          width: Scale.height(30), // Placeholder's width
        ),
      ),
    );
  }
}
