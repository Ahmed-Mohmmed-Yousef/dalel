part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashToHome extends SplashState {}

final class SplashToSignUp extends SplashState {}

final class SplashToSignIn extends SplashState {}

final class SplashToOnboarding extends SplashState {}
