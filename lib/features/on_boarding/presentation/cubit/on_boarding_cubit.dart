import 'package:bloc/bloc.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/utils/app_constants.dart';
import 'package:dalel/features/on_boarding/data/models/onboarding_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(this.list) : super(OnBoardingInitial(list: list));
  final List<OnBoardingModel> list;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onViewDidAppear() {
    Future.delayed(const Duration(seconds: 1), () {
      emit(OnBoardingInitial(list: list));
    });
  }

  void onSkipTapped() {
    _goToLoginVew();
  }

  void onNextTapped() {
    if (_currentIndex == list.length - 1) {
      onCreateAccountTapped();
    } else {
      emit(OnBoardingNextPage(newIndex: _currentIndex++));
    }
  }

  void onIndexChanged(int index) {
    _currentIndex = index;
    emit(OnBoardingJumpToPage(newIndex: _currentIndex));
  }

  void onLoginTapped() {
    _goToLoginVew();
  }

  void onCreateAccountTapped() {
    CacheHelper.sharedPreferences
        .setBool(AppConstants.isOnBoardingAppeared, true);
    emit(OnBoardingRouteToRegisterSate());
  }

  void _goToLoginVew() {
    CacheHelper.sharedPreferences
        .setBool(AppConstants.isOnBoardingAppeared, true);
    emit(OnBoardingRouteToLoginSate());
  }
}
