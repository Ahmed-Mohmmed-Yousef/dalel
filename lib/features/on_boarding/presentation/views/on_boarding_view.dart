import 'package:dalel/core/router/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/on_boarding/data/models/onboarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/onboarding_wiget_body.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/splas_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  List<OnBoardingModel> list = [];

  @override
  void initState() {
    super.initState();
    final cubit = context.read<OnBoardingCubit>();
    cubit.onViewDidAppear();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<OnBoardingCubit>();
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          switch (state) {
            case OnBoardingInitial():
              list = state.list;
            case OnBoardingRouteToLoginSate():
              replacementNavigateTo(context, AppRouter.signIn);
            case OnBoardingRouteToRegisterSate():
              replacementNavigateTo(context, AppRouter.signUp);
            case OnBoardingNextPage():
              _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            case OnBoardingJumpToPage():
              _controller.jumpToPage(state.newIndex);
          }
        },
        builder: (context, state) => _buildBody(context),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 40),
            SplashNavBar(
              onTap: () => cubit.onSkipTapped(),
            ),
            OnBoardingWidgetBody(
              controller: _controller,
              list: cubit.list,
              onPageChanged: (newIndex) {
                cubit.onIndexChanged(newIndex);
              },
            ),
            const SizedBox(height: 88),
            CustomBtn(
              title: customBtnTitle(cubit),
              onPressed: () => cubit.onNextTapped(),
            ),
            const SizedBox(height: 18),
            if (cubit.currentIndex == list.length - 1)
              GestureDetector(
                onTap: () => cubit.onLoginTapped(),
                child: const Text(
                  AppStrings.loginNow,
                  style: AppTextStyles.poppins300style16,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String customBtnTitle(OnBoardingCubit cubit) {
    if (cubit.currentIndex == list.length - 1) {
      return AppStrings.createAccount;
    }
    return AppStrings.next;
  }
}
