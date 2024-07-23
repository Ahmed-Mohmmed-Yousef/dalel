import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/router/app_router.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/app_text_feild.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          replacementNavigateTo(context, AppRouter.signIn);
        } else if (state is SignupFailureState) {
          showToast(msg: state.errorMsg);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Form(
          key: cubit.signupFormKey,
          child: Column(
            children: [
              AppTextField(
                labeltext: AppStrings.fristName,
                onChanged: (firstName) => cubit.firstName = firstName,
                validator: cubit.emptyValidator,
              ),
              AppTextField(
                labeltext: AppStrings.lastName,
                onChanged: (lastName) => cubit.lastName = lastName,
                validator: cubit.emptyValidator,
              ),
              AppTextField(
                labeltext: AppStrings.emailAddress,
                onChanged: (emailAddress) => cubit.emailAddress = emailAddress,
                validator: cubit.emptyValidator,
              ),
              AppTextField(
                  labeltext: AppStrings.password,
                  onChanged: (password) => cubit.password = password,
                  validator: cubit.emptyValidator,
                  obscureText: cubit.isObscureText,
                  suffixIcon: IconButton(
                      onPressed: () => cubit.obscureTextUpdate(),
                      icon: Icon(
                        cubit.isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ))),
              const TermsAndConditions(),
              const SizedBox(height: 88),
              state is SignupLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      backgroundColor: cubit.termsAndConditions == true
                          ? null
                          : AppColors.grey,
                      title: AppStrings.signUp,
                      onPressed: () => cubit.onSignUpTapped(),
                    ),
            ],
          ),
        );
      },
    );
  }
}
