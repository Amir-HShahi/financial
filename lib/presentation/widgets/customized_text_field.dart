import 'package:financial/core/utils/design_colors.dart';
import 'package:financial/core/utils/scale.dart';
import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? toggleableVisibility;
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
  Widget build(BuildContext context) {
    final fontSize = Scale.height(16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Scale.height(18),
            height: 1,
            color: DesignColors.deepDarkBlue,
          ),
        ),
        SizedBox(height: Scale.height(8)),
        TextField(
          controller: controller,
          cursorColor: DesignColors.grey,
          style: TextStyle(
            fontSize: fontSize,
            height: 1,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: Scale.width(16),
              vertical: Scale.height(12),
            ),
            fillColor: DesignColors.white,
            constraints: BoxConstraints(
              maxHeight: Scale.height(40),
              minHeight: Scale.height(40),
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
            hintText: hintText,
            hintStyle: TextStyle(
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
