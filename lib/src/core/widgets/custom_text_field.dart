import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.validationText,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.inputStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.inputAction,
    this.autofocus = false,
    this.initialValue,
    this.filled,
    this.withBorder=true,
    this.maxLines=1
  });

  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? validationText;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;
  final TextInputType keyboardType;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final TextInputAction? inputAction;
  final String? initialValue;
  final bool withBorder;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      style: inputStyle ?? context.textTheme.bodyMedium!.copyWith(
          fontSize: 14.sp, fontWeight: FontWeight.w400),
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border:withBorder? _border(context,):null,
        enabledBorder:withBorder? _border(context, color: borderColor,borderWidth: 1):null,
        focusedBorder:withBorder? _border(context,
            color: focusedBorderColor ?? context.themeData.primaryColor,borderWidth: 2):null,
        hintStyle: hintStyle ??
            context.textTheme.labelSmall?.copyWith(
                  color: ColorsManager.hintColor,
                  fontSize: 14.sp,
                ),
        errorStyle: context.textTheme.titleSmall?.copyWith(
          color: Colors.red,
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
        ),
        contentPadding: contentPadding,
        filled: filled,
        fillColor: fillColor,
      ),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      autofocus: autofocus,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }

  OutlineInputBorder _border(BuildContext context,
          {Color? color, double? borderWidth}) =>
      OutlineInputBorder(
        borderRadius: (borderRadius ?? 12.r).br,
        borderSide: BorderSide(
            color: color ??
                context.themeData.colorScheme.outline.withValues(alpha: 0.3),
            width: borderWidth ?? 1.5),
      );
}
