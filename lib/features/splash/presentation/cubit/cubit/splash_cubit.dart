import 'package:bloc/bloc.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/app_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void onViewDidAppear() {
    Future.delayed(const Duration(seconds: 2), () {
      bool isOnBoardingAppeared = getIt<CacheHelper>()
              .getData(key: AppConstants.isOnBoardingAppeared) ??
          false;
      if (isOnBoardingAppeared == true) {
        emit(SplashToOnboarding());
      } else {
        emit(SplashToHome());
      }
    });
  }
}
