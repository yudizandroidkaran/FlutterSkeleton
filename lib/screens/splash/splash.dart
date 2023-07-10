import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/colors.gen.dart';
import 'package:flutter_skeleton/screens/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    /*Future.delayed(const Duration(seconds: 2), () {

    });*/

    return Scaffold(
      body: Container(
          color: ColorName.bgBlack,
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Icon(Icons.flutter_dash, color: ColorName.white, size: 30.w)),
    );
  }
}
