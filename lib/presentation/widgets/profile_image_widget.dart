import 'package:flutter/material.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';


/// A widget that displays a circular profile image surrounded by a border.
/// Currently, the profile image is represented by a red placeholder. todo
class ProfileImageWidget extends StatelessWidget {
  final double size;
  const ProfileImageWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Setting the height and width of the outer circle
      height: size,
      width: size,
      padding: EdgeInsets.all(Scale.height(3)),
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
          color: DesignColors.grey,
          height: Scale.height(30), // Placeholder's height
          width: Scale.height(30), // Placeholder's width
        ),
      ),
    );
  }
}
