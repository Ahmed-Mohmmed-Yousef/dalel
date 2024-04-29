part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {
  final List<OnBoardingModel> list;

  OnBoardingInitial({required this.list});
}

final class OnBoardingRouteToLoginSate extends OnBoardingState {}

final class OnBoardingRouteToRegisterSate extends OnBoardingState {}

final class OnBoardingNextPage extends OnBoardingState {
  final int newIndex;
  OnBoardingNextPage({required this.newIndex});
}

final class OnBoardingJumpToPage extends OnBoardingState {
  final int newIndex;
  OnBoardingJumpToPage({required this.newIndex});
}
