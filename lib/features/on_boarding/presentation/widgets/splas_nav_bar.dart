import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashNavBar extends StatelessWidget {
  final void Function()? onTap;
  const SplashNavBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.skip,
          style: AppTextStyles.poppins300style16
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
