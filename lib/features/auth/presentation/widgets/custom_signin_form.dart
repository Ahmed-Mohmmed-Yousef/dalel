import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/router/app_router.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/app_text_feild.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          showToast(msg: "Loged in successfully");
          replacementNavigateTo(context, AppRouter.home);
        } else if (state is SignInFailureState) {
          showToast(msg: state.errorMsg);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Form(
          key: cubit.signinFormKey,
          child: Column(
            children: [
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
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const ForgotPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SignupLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      title: AppStrings.signIn,
                      onPressed: () => cubit.onSignInTapped(),
                    ),
            ],
          ),
        );
      },
    );
  }
}
