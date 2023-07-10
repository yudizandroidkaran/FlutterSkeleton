import 'package:flutter/material.dart';
import 'package:flutter_skeleton/components/widget_utils.dart';
import 'package:sizer/sizer.dart';

import '../gen/colors.gen.dart';
import '../utils/strings.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onClick;
  final bool? isEnabled;
  final String? disabledMessage;
  final double? height;
  final bool? showMargin;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? showIconOnly;
  final bool? isLoading;

  const CustomButton(
      {super.key,
      required this.onClick,
      required this.buttonText,
      this.isEnabled,
      this.disabledMessage,
      this.suffixIcon,
      this.showIconOnly,
      this.showMargin,
      this.height,
      this.prefixIcon,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return _renderMobileButton(context);
  }

  Widget _renderMobileButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled ?? true) {
          onClick();
        } else {
          if (disabledMessage != null) {}
        }
      },
      child: Container(
        height: height ?? 6.h,
        margin: showMargin ?? true
            ? EdgeInsets.symmetric(horizontal: 4.w)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
            border: Border.all(width: 0.3.w, color: ColorName.textBlack),
            color: isEnabled ?? true
                ? Theme.of(context).primaryColor
                : ColorName.gray,
            borderRadius: BorderRadius.all(Radius.circular(2.5.w))),
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            showIconOnly ?? false
                ? isLoading ?? false
                    ? SizedBox(
                        height: 7.w,
                        width: 7.w,
                        child: Transform.scale(
                          scale: 0.7,
                          child: CircularProgressIndicator(
                            strokeWidth: 0.9.w,
                            color: ColorName.white,
                          ),
                        ),
                      )
                    : suffixIcon!
                : Row(
                    children: [
                      prefixIcon != null ? prefixIcon! : Container(),
                      prefixIcon != null ? addWidth(0.w) : addWidth(0.w),
                      Text(
                        key: key,
                        buttonText,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 11.sp,
                            color: isEnabled ?? true
                                ? ColorName.white
                                : ColorName.textBlack,
                            fontFamily: AppStrings.fontDmSans,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
