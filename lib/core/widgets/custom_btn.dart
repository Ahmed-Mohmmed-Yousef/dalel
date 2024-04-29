import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final void Function()? onPressed;
  const CustomBtn(
      {super.key, this.onPressed, required this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black45,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.poppins500style18.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
