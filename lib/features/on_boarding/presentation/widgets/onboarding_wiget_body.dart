import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/on_boarding/data/models/onboarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/custome_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  final PageController controller;
  final void Function(int)? onPageChanged;
  final List<OnBoardingModel> list;
  const OnBoardingWidgetBody(
      {super.key,
      required this.controller,
      this.onPageChanged,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        pageSnapping: false,
        padEnds: false,
        onPageChanged: onPageChanged,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return OnBoardingPage(model: list[index], controller: controller);
        },
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
    required this.controller,
  });

  final OnBoardingModel model;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 290,
          width: 343,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 24),
        CustomSmoothPageIndicator(controller: controller),
        const SizedBox(height: 16),
        Text(
          model.title,
          style: AppTextStyles.poppins500style24
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Text(
          model.body,
          style: AppTextStyles.poppins300style16,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
