import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String labeltext;
  const AppTextField({super.key, required this.labeltext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: AppTextStyles.poppins500style18,
          border: getBordersStyle(),
          enabledBorder: getBordersStyle(),
          focusedBorder: getBordersStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder getBordersStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.grey));
  }
}
