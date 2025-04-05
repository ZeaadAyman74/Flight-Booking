import 'package:flight_booking/gen/fonts.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'theme_styles.dart';

ThemeData get lightTheme => ThemeData(
    fontFamily: FontFamily.sfUiDisplay,
    brightness: Brightness.light,
    primaryColor: ColorsManager.primaryColor,
    hintColor: ColorsManager.hintColor,
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: ColorsManager.white,
    primaryColorDark: ColorsManager.black,
    canvasColor: ColorsManager.white,
    indicatorColor:ColorsManager.primaryColor,
    disabledColor:ColorsManager.darkGray ,
    colorScheme: ColorsManager.colorSchemeLight,
    dividerColor: ColorsManager.dividerColor,
    dividerTheme: const DividerThemeData(
      color: ColorsManager.dividerColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: ColorsManager.black.withValues(alpha: 0.1),
    shadowColor: ColorsManager.black.withValues(alpha: 0.1),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsManager.gray,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsManager.primaryColor,
        elevation: 0,
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    ),

    textTheme: TextTheme(
        titleSmall: TextStyle(
          color: ColorsManager.blueBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ), // used

        titleLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.blueBlack,
        ),

        titleMedium: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.blueBlack,
        ), // used

        labelSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),

        labelMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.blueBlack,
        ), //used

        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: ColorsManager. hintColor,
        ), // used

        bodyMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.blueBlack,
        ), // used
        displayMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.black,
        ),
        displaySmall: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.darkGray
        ),
        headlineMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.primaryColor,
        ),
        headlineSmall: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.blueBlack
        ) // used
    ),

    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
        dateTimePickerTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          height: 1.5,
          locale: Locale('en', 'US'),
        ),
      ),
    ),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      buttonColor: ColorsManager.primaryColor,
      splashColor: Colors.grey,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
          const WidgetStatePropertyAll(ColorsManager.primaryColor),
          padding: const WidgetStatePropertyAll(
              EdgeInsetsDirectional.symmetric(vertical: 10)),
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22))),
          enableFeedback: true,
          textStyle: WidgetStatePropertyAll(TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: FontFamily.sfUiDisplay
          )
          ),
          // textStyle: ,
        )),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: ColorsManager.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontSize: 17.sp,
        fontFamily: FontFamily.sfUiDisplay,
        color: ColorsManager.blueBlack,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        fontSize: 21.sp,
        height: 1.5,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blueBlack,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.primaryColor,
        size: 28.sp,
      ),
      actionsIconTheme: IconThemeData(
        color: ColorsManager.blueBlack,
        size: 28.sp,
      ),
    ),
    datePickerTheme: ThemeStyles.lightPickerTheme,
    timePickerTheme: ThemeStyles.timePickerThemeData,
    iconTheme: const IconThemeData(color: ColorsManager.primaryColor)
);
