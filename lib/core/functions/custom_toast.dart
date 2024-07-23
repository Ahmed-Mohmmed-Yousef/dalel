import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg, Color? backgroundColor}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: backgroundColor ?? AppColors.primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
