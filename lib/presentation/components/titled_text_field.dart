import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class TitledTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String hintText;
  final String title;
  final Widget? prefixIcon;
  final String? suffixIcon;
  final bool? obscureText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final String? validateParam;
  final TextInputAction? inputAction;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final Function? onClick;
  final Function(String)? onChanged;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? showTitle;
  final int? lines;
  final bool? autoFocus;

  const TitledTextField(
      {Key? key,
      this.textInputType,
      required this.title,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      required this.textEditingController,
      this.validator,
      this.validateParam,
      this.inputAction,
      this.maxLength,
      this.onClick,
      this.onChanged,
      this.enabled,
      this.focusNode,
      this.textInputFormatter,
      this.padding,
      this.showTitle,
      this.lines,
      this.autoFocus
      })
      : super(key: key);

  @override
  State<TitledTextField> createState() => _TitledTextFieldState();
}

class _TitledTextFieldState extends State<TitledTextField> {
  var _isPassword = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _isPassword = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return _renderMobileTextField(context);
  }

  Widget _renderMobileTextField(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.showTitle ?? true,
            child: Column(
              children: [
                Text(widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 9.5.sp, color: ColorName.textBlack)),
                SizedBox(height: 1.h),
              ],
            ),
          ),
          TextFormField(
            key: widget.key,
            focusNode: _focusNode,
            textInputAction: widget.inputAction ?? TextInputAction.next,
            keyboardType: widget.textInputType ?? TextInputType.text,
            cursorColor: Theme.of(context).primaryColor,
            onChanged: (text) {
              if (widget.onChanged != null) widget.onChanged!(text);
            },
            obscureText: _isPassword,
            autovalidateMode: AutovalidateMode.disabled,
            controller: widget.textEditingController,
            maxLength: widget.maxLength ?? 100,
            maxLines: widget.lines ?? 1,
            minLines: widget.lines ?? 1,
            obscuringCharacter: "*",
            enabled: widget.enabled ?? true,
            autofocus: widget.autoFocus ?? false,
            inputFormatters: widget.textInputFormatter,
            onTap: widget.onClick != null ? widget.onClick!() : () {},
            style: TextStyle(
                fontSize: 12.sp,
                color: widget.enabled ?? true
                    ? ColorName.textBlack
                    : ColorName.textGray),
            decoration: InputDecoration(
              errorMaxLines: 3,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w100),
              counterText: "",
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.obscureText ?? false
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        Assets.icons.icEye.path,
                        height: 6.w,
                        width: 6.w,
                        color: _isPassword ? ColorName.red : ColorName.bgBlack,
                      ),
                    )
                  : widget.suffixIcon != null
                      ? IconButton(
                          onPressed: null,
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(widget.suffixIcon!,
                              height: 6.w, width: 6.w, color: ColorName.bgBlack),
                        )
                      : null,
              contentPadding: EdgeInsets.fromLTRB(4.w, 1.8.h, 4.w, 1.8.h),
              fillColor: ColorName.white,
              filled: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.gray, width: 0.2.w),
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.textBlack, width: 0.2.w),
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorName.gray.withOpacity(0.5), width: 0.2.w),
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.gray, width: 0.2.w),
                borderRadius: BorderRadius.circular(2.5.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.gray, width: 0.2.w),
                borderRadius: BorderRadius.circular(2.5.w),
              ),
            ),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
