import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: BlocProvider.of<AuthCubit>(context).termsAndConditions ?? false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: AppColors.grey),
      onChanged: (value) {
        setState(() {
          BlocProvider.of<AuthCubit>(context)
              .updateTermsAndConditionsCheckBox(value);
        });
      },
    );
  }
}
