import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/router/app_router.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/app_text_feild.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 64)),
            SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.forgotPassword)),
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(child: ForgotPasswordBody()),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.forgotPassword,
              width: 235,
              height: 235,
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.forgotPasswordDescription,
              style: AppTextStyles.poppins400style14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Form(
              key: cubit.forgotFormKey,
              child: AppTextField(
                labeltext: AppStrings.emailAddress,
                onChanged: (emailAddress) => cubit.emailAddress = emailAddress,
                validator: cubit.emptyValidator,
              ),
            ),
            const SizedBox(height: 130),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is ResetPassworSuccessState) {
                  showToast(msg: "Check your email to reset your password");
                  navigateTo(context, AppRouter.signIn);
                }
                if (state is ResetPassworFailureState) {
                  showToast(msg: state.errorMsg, backgroundColor: Colors.red);
                }
              },
              builder: (context, state) {
                return state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : CustomBtn(
                        backgroundColor: AppColors.primaryColor,
                        title: AppStrings.sendVerificationCode,
                        onPressed: () {
                          cubit.onSendVerificatiionCodeTapped();
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
