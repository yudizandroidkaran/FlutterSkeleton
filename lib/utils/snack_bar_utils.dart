import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../gen/colors.gen.dart';

class SnackBarUtil {
  // This will show Simple SnackBar which is common for all
  static void showSnackBar(text) {
    Get.rawSnackbar(
        message: text,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1500),
        backgroundColor: ColorName.bgBlack.withOpacity(0.8),
        snackStyle: SnackStyle.FLOATING,
        borderRadius: 3.w,
        dismissDirection: DismissDirection.down,
        margin: EdgeInsets.only(bottom: 2.5.h, left: 4.5.w, right: 4.5.w));
  }

  // This will show SnackBar with Red Color and according to design
  static void showErrorSnackBar(text) {
    Get.rawSnackbar(
        messageText: Center(
            child: Text(text,
                style: Theme.of(Get.context!)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: ColorName.white, fontSize: 11.sp))),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 1500),
        backgroundColor: ColorName.red,
        borderRadius: 3.w,
        snackStyle: SnackStyle.FLOATING,
        dismissDirection: DismissDirection.down,
        margin: EdgeInsets.only(bottom: 2.5.h, left: 4.5.w, right: 4.5.w));
  }
}
