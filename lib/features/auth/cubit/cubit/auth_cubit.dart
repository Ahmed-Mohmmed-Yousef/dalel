import 'package:dalel/features/auth/cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? termsAndConditions;
  bool isObscureText = true;
  final GlobalKey<FormState> signupFormKey = GlobalKey();
  final GlobalKey<FormState> signinFormKey = GlobalKey();

  void signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
            SignupFailureState(errorMsg: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailureState(
            errorMsg: 'The account already exists for that email.'));
      } else if (e.code == "invalid-email") {
        emit(SignupFailureState(errorMsg: "The email address is invalid."));
      } else {
        emit(SignupFailureState(errorMsg: e.toString()));
      }
    } catch (e) {
      emit(SignupFailureState(errorMsg: e.toString()));
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errorMsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMsg: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFailureState(errorMsg: e.toString()));
      }
    } catch (e) {
      emit(SignInFailureState(errorMsg: e.toString()));
    }
  }

  String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  void updateTermsAndConditionsCheckBox(bool? value) {
    termsAndConditions = value;
    emit(TermsAndConditionsUpdateState());
  }

  void onSignUpTapped() {
    if (termsAndConditions != true) return;
    if (signupFormKey.currentState!.validate()) {
      signUpWithEmailAndPassword();
    }
  }

  void onSignInTapped() {
    if (signinFormKey.currentState!.validate()) {
      signInWithEmailAndPassword();
    }
  }

  void obscureTextUpdate() {
    isObscureText = !isObscureText;
    emit(ObsecureTextUpdateState());
  }
}
