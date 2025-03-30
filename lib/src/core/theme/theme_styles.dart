import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ThemeStyles {
  const ThemeStyles._();

  static DatePickerThemeData lightPickerTheme = DatePickerThemeData(
    backgroundColor: ColorsManager.white,
    headerForegroundColor: Colors.white,
    headerBackgroundColor: ColorsManager.primaryColor,
    rangePickerBackgroundColor: Colors.white,
    rangePickerHeaderBackgroundColor: Colors.white,
    rangePickerSurfaceTintColor: Colors.white,
    rangeSelectionBackgroundColor: Colors.white,
    headerHeadlineStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        // fontFamily: FontFamily.sfUiDisplay
    ),
    weekdayStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: ColorsManager.primaryColor,
    ),

    dayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.white;
        }else if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return ColorsManager.blueBlack;
      },
    ),
    todayForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.white;
        }
        return ColorsManager.blueBlack;
      },
    ),
    yearBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryColor;
        }
        return Colors.grey.shade300;
      },
    ),
    yearForegroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return ColorsManager.blueBlack;
      },
    ),
    yearStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    rangeSelectionOverlayColor: WidgetStateProperty.resolveWith(
          (states) => ColorsManager.primaryColor,
    ),
    dayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
        if (states.contains(WidgetState.selected)) {
          return ColorsManager.primaryColor;
        }
        return Colors.transparent;
      },
    ),
    cancelButtonStyle: cancelButtonStyle,
    confirmButtonStyle: confirmButtonStyle,
  );

  static TimePickerThemeData timePickerThemeData = TimePickerThemeData(
    backgroundColor: ColorsManager.white,
    cancelButtonStyle: cancelButtonStyle,
    confirmButtonStyle: confirmButtonStyle,
    hourMinuteTextColor: Colors.black,
    dialTextColor: Colors.black,
  );

  static ButtonStyle cancelButtonStyle = ButtonStyle(
    textStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: Colors.red,
      ),
    ),
    foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.red),
  );

  static ButtonStyle confirmButtonStyle = ButtonStyle(
    textStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: ColorsManager.primaryColor,
      ),
    ),
    foregroundColor: WidgetStateProperty.resolveWith(
          (states) => ColorsManager.primaryColor,
    ),
  );
}
