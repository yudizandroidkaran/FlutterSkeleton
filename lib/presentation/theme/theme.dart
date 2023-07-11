import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/colors.gen.dart';
import 'package:sizer/sizer.dart';

var appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: ColorName.red,
  primaryColorDark: ColorName.primaryDark,
  primaryColorLight: ColorName.white,
  hintColor: ColorName.textGray,
  platform: TargetPlatform.iOS,
  brightness: Brightness.light,
  fontFamily: "DMSans",
  textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorName.textBlack,
          fontFamily: "DMSansBold"),
      titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: ColorName.textBlack,
          fontFamily: "DMSansBold"),
      titleSmall: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        color: ColorName.textBlack,
      ),
      labelMedium: TextStyle(fontSize: 11.sp, color: ColorName.textGray),
      labelSmall: TextStyle(
          fontSize: 10.5.sp, color: ColorName.textGray, letterSpacing: 0),
      bodyLarge: TextStyle(fontSize: 13.5.sp, color: ColorName.textBlack),
      bodyMedium: TextStyle(fontSize: 12.sp, color: ColorName.textBlack),
      bodySmall: TextStyle(fontSize: 10.sp, color: ColorName.textBlack)),
);
