import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/extension.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsWidget extends StatelessWidget {
  const HistoricalPeriodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodItem(
            title: AppStrings.ancientEgypt, assetName: Assets.onBoardingOne),
        HistoricalPeriodItem(
            title: AppStrings.islamicEra, assetName: Assets.onBoardingTwo),
      ],
    );
  }
}

class HistoricalPeriodItem extends StatelessWidget {
  final String title;
  final String assetName;
  const HistoricalPeriodItem({
    super.key,
    required this.title,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    final double width = (context.screenWidth - (32 + 16)) * 0.5;
    final double height = width * 0.585;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(2, 6),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins500style16
                    .copyWith(color: AppColors.deepBrown),
              ),
            ),
            Container(
              width: 47,
              height: 64,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(assetName)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
