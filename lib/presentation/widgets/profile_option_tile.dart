import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';

class ProfileOptionTile extends StatelessWidget {
  final Function() onTap;
  final String leadingIconPath;
  final String title;

  const ProfileOptionTile({
    super.key,
    required this.onTap,
    required this.leadingIconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: Scale.height(44),
            width: Scale.height(44),
            padding: EdgeInsets.all(Scale.height(10)),
            decoration: BoxDecoration(
              color: Color(0xffA4D9FF),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(leadingIconPath, height: Scale.height(24)),
          ),
          SizedBox(width: Scale.width(16)),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: Scale.height(18),
              fontWeight: FontWeight.w500,
              color: DesignColors.deepDarkBlue,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: DesignColors.royalBlue,
            size: Scale.width(16),
          ),
        ],
      ),
    );
  }
}
