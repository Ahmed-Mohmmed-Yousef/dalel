import 'package:dalel/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/on_boarding/data/models/onboarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/cubit/cubit/splash_cubit.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: AppRouter.splashView,
    builder: (context, state) => BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(),
      child: const SplashView(),
    ),
  ),
  GoRoute(
    path: AppRouter.onBoardingView,
    builder: (context, state) => BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(OnBoardingModel.onBoardingList),
      child: const OnBoardingView(),
    ),
  ),
  GoRoute(
    path: AppRouter.signUp,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignUpView(),
    ),
  ),
  GoRoute(
    path: AppRouter.signIn,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignInView(),
    ),
  ),
  GoRoute(
    path: AppRouter.forgotPassword,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgotPasswordView(),
    ),
  ),
  GoRoute(
    path: AppRouter.home,
    builder: (context, state) => const HomeView(),
  ),
]);

abstract class AppRouter {
  static const String splashView = "/";
  static const String onBoardingView = "/onBoarding";
  static const String signUp = "/signUp";
  static const String signIn = "/signIn";
  static const String home = "/HomeView";
  static const String forgotPassword = "/ForgotPassword";
}

void navigateTo(BuildContext context, String path) {
  GoRouter.of(context).push(path);
}

void replacementNavigateTo(BuildContext context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void navigationPop(BuildContext context) {
  GoRouter.of(context).pop();
}
