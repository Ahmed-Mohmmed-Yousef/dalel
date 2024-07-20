// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String labeltext;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  const AppTextField({
    Key? key,
    required this.labeltext,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: AppTextStyles.poppins500style18,
          border: getBordersStyle(),
          enabledBorder: getBordersStyle(),
          focusedBorder: getBordersStyle(),
          suffixIcon: suffixIcon,
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
