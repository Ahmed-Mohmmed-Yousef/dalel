import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: AppTextStyles.poppins600style28,
        textAlign: TextAlign.center,
      ),
    );
  }
}
