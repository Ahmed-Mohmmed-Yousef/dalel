import 'package:dalel/core/router/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/splash/presentation/cubit/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().onViewDidAppear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashToHome) {
          replacementNavigateTo(context, AppRouter.home);
        }
        if (state is SplashToOnboarding) {
          replacementNavigateTo(context, AppRouter.onBoardingView);
        }
        if (state is SplashToSignUp) {
          replacementNavigateTo(context, AppRouter.signUp);
        }

        if (state is SplashToSignIn) {
          replacementNavigateTo(context, AppRouter.signIn);
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            AppStrings.appName,
            style: AppTextStyles.pacifico400style64,
          ),
        ),
      ),
    );
  }
}
