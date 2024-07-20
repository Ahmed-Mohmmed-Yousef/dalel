sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailureState extends AuthState {
  final String errorMsg;
  SignupFailureState({required this.errorMsg});
}

final class TermsAndConditionsUpdateState extends AuthState {}

final class ObsecureTextUpdateState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {}

final class SignInFailureState extends AuthState {
  final String errorMsg;
  SignInFailureState({required this.errorMsg});
}
