import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';

class CustomizedTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool toggleableVisibility;
  final String title;
  final String hintText;

  const CustomizedTextField({
    super.key,
    required this.controller,
    this.toggleableVisibility = false,
    required this.title,
    required this.hintText,
  });

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  bool isVisible = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = Scale.height(14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: Scale.height(16),
            height: 1,
            color: DesignColors.deepDarkBlue,
          ),
        ),
        SizedBox(height: Scale.height(8)),
        TextField(
          controller: widget.controller,
          cursorColor: DesignColors.grey,
          obscureText: isVisible,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            height: 1,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            isDense: true,
            suffix:
                widget.toggleableVisibility
                    ? _Suffix(
                      isVisible: isVisible,
                      toggleVisibility: toggleVisibility,
                      size: fontSize,
                    )
                    : null,
            suffixIconConstraints: BoxConstraints(
              minHeight: fontSize,
              minWidth: fontSize,
              maxWidth: fontSize,
              maxHeight: fontSize,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Scale.width(16),
              vertical: Scale.height(12),
            ),
            fillColor: DesignColors.white,
            constraints: BoxConstraints(
              maxHeight: Scale.height(42),
              minHeight: Scale.height(42),
              minWidth: Scale.width(345),
              maxWidth: Scale.width(345),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: DesignColors.grey,
                width: Scale.height(1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DesignColors.grey,
                width: Scale.height(1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DesignColors.grey,
                width: Scale.height(1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DesignColors.grey,
                width: Scale.height(1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DesignColors.cyan,
                width: Scale.height(1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DesignColors.cyan,
                width: Scale.height(1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: fontSize,
              height: 1,
              fontWeight: FontWeight.w500,
              color: DesignColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class _Suffix extends StatelessWidget {
  final bool isVisible;
  final Function() toggleVisibility;
  final double size;
  const _Suffix({
    required this.isVisible,
    required this.toggleVisibility,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: toggleVisibility,
      child: SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          isVisible
              ? 'assets/icons/closed_eye.svg'
              : 'assets/icons/open_eye.svg',
          height: Scale.height(16),
        ),
      ),
    );
  }
}
