import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/widgets/app_text_feild.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
              const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.welcome),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              const SliverToBoxAdapter(
                  child: AppTextField(labeltext: AppStrings.fristName)),
              const SliverToBoxAdapter(
                  child: AppTextField(labeltext: AppStrings.lastName)),
              const SliverToBoxAdapter(
                  child: AppTextField(labeltext: AppStrings.emailAddress)),
              const SliverToBoxAdapter(
                  child: AppTextField(labeltext: AppStrings.password)),
              const SliverToBoxAdapter(child: TermsAndConditions()),
              const SliverToBoxAdapter(child: SizedBox(height: 88)),
              SliverToBoxAdapter(
                  child: CustomBtn(title: AppStrings.signUp, onPressed: () {})),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(
                  child: HaveAnAccountWidget(
                      text1: AppStrings.alreadyHaveAnAccount,
                      text2: AppStrings.signIn)),
            ],
          ),
        ),
      ),
    );
  }
}
