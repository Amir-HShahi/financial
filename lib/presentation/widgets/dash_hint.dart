import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class DashHint extends StatelessWidget {
  final String title;
  const DashHint({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: Scale.height(2),
          width: Scale.width(84),
          color: DesignColors.grey,
          margin: EdgeInsetsDirectional.only(end: Scale.width(8)),
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            height: 1,
            fontWeight: FontWeight.w500,
            fontSize: Scale.height(14),
            color: DesignColors.grey,
          ),
        ),
        Container(
          height: Scale.height(2),
          width: Scale.width(84),
          color: DesignColors.grey,
          margin: EdgeInsetsDirectional.only(start: Scale.width(8)),
        ),
      ],
    );
  }
}
