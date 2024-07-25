import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/functions/custom_toast.dart';
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
  final GlobalKey<FormState> forgotFormKey = GlobalKey();

  void signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserProfile();
      await sendEmailVerification();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleExceptions(e);
    } catch (e) {
      emit(SignupFailureState(errorMsg: e.toString()));
    }
  }

  void _signUpHandleExceptions(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignupFailureState(errorMsg: "The password provided is too weak."));
    } else if (e.code == 'email-already-in-use') {
      emit(SignupFailureState(
          errorMsg: 'The account already exists for that email.'));
    } else if (e.code == "invalid-email") {
      emit(SignupFailureState(errorMsg: "The email address is invalid."));
    } else {
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
      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        emit(SignInSuccessState());
      } else {
        emit(SignInFailureState(errorMsg: "Verify your account."));
      }
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

  Future<void> sendEmailVerification() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;
    await currentUser.sendEmailVerification();
    showToast(msg: "Successfully, Check your email to verify your account");
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

  void resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPassworSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ResetPassworFailureState(errorMsg: e.toString()));
    }
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

  void onSendVerificatiionCodeTapped() {
    if (forgotFormKey.currentState!.validate()) {
      resetPasswordWithLink();
    }
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": emailAddress,
      "first_name": firstName,
      "last_name": lastName,
    });
  }

  void obscureTextUpdate() {
    isObscureText = !isObscureText;
    emit(ObsecureTextUpdateState());
  }
}
