import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flight_booking/src/core/widgets/adaptive_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
        this.titleStyle,
      this.titleColor,
      this.borderColor,
      this.backgroundColor,
      this.height=55,
      this.width,
      this.isEnabled = true,
      this.isLoading = false,
      this.borderRadius=16});

  final String title;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final bool isEnabled;
  final void Function()? onPressed;
  final bool isLoading;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor ??
                (isEnabled
                    ? ColorsManager.primaryColor
                    : ColorsManager.primaryColor.withValues(alpha: .3))),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: WidgetStatePropertyAll(
                Size(width ?? context.width, height!.h)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: borderRadius!.br,
                side: borderColor == null
                    ? BorderSide.none
                    : BorderSide(color: borderColor!))),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h))),
        child: isLoading
            ? const AdaptiveProgress()
            : Text(
                title,
                style:titleStyle?? TextStyle(
                    color: titleColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
              ));
  }
}
