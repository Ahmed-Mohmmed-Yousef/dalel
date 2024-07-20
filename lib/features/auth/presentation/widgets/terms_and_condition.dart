import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: AppStrings.iHaveAgreeToOur,
                  style: AppTextStyles.poppins400style12
                      .copyWith(color: AppColors.deepGrey)),
              TextSpan(
                  text: AppStrings.termsAndCondition,
                  style: AppTextStyles.poppins400style12.copyWith(
                      color: AppColors.deepGrey,
                      decoration: TextDecoration.underline)),
            ],
          ),
        ),
      ],
    );
  }
}
