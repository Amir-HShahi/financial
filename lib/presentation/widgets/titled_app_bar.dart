import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitledAppBar extends PreferredSize {
  final String title;
  TitledAppBar({super.key, required this.title})
    : super(
        preferredSize: Size(Scale.width(393), Scale.height(112)),
        child: _AppBar(title: title),
      );
}

class _AppBar extends StatelessWidget {
  final String title;
  const _AppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    void pressBackHandler() {
      Navigator.pop(context);
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: Scale.height(50),
          bottom: Scale.height(35),
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            GestureDetector(
              onTap: pressBackHandler,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: Scale.width(24)),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: Scale.height(16),
                  color: DesignColors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: Scale.height(18),
                  color: DesignColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
