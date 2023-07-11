import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/colors.gen.dart';
import 'package:sizer/sizer.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout(
      {super.key, required bool isLoading, required Widget child})
      : _child = child,
        _isLoading = isLoading;

  final bool _isLoading;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_child, Visibility(visible: _isLoading, child: loadingView())],
    );
  }
}

Widget loadingView() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        color: Colors.black.withOpacity(0.7),
      ),
      Center(
        child: Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(3.w)),
          child: Center(
            child: CircularProgressIndicator(
              color: ColorName.red,
              strokeWidth: 1.w,
            ),
          ),
        ),
      ),
    ],
  );
}
