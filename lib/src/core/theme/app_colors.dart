import 'package:flutter/material.dart';

class ColorsManager {
  ColorsManager._();

  static const primaryColor = Color(0xff2262AD);
  static const secondaryColor=Color(0xffF75D37);
  static const darkBue = Color(0xff183D92);
  static const blueBlack=Color(0xff1C2A4A);
  static const black=Colors.black;
  static const lightBlack=Color(0xff484848);
  static const orange = Color(0xffFDB344);
  static const darkGray = Color(0xff8191B7);
  static const gray=Color(0xff818C99);
  static const red=Color(0xffFF4949);
  static const green=Color(0xff10DC92);
  static const offWhite=Color.fromRGBO(228, 228, 228, 0.6);
  static const lightBlue = Color(0xffD9EEFE);
  static const white=Colors.white;



  // Light Theme Colors
  static const borderColorLight=Color(0xffC4C4C4);
  static const textFieldFillColor=Color(0xffF2F3F5);
  static const hintColor=Color(0xffB8C1CC);
  static const disabledTabBarColor=Color(0xff848F95);
  static const unSelectedDayColor=Color(0xffBCC2CE);
  static const dividerColor=Color(0xffE6E6E6);
  static const appbarColorLight=white;
  static const refreshColor=primaryColor;


  static ColorScheme colorSchemeLight = const ColorScheme(
    primary: primaryColor,
    onPrimary: blueBlack,
    primaryContainer: white,
    secondary: Colors.white,
    secondaryContainer: textFieldFillColor,
    brightness: Brightness.light,
    error: red,
    onError: red,
    onSecondary: white,
    onSurface: primaryColor,
    surface: white,
    onTertiary: disabledTabBarColor,
    tertiary: disabledTabBarColor,
    outline: borderColorLight,
    surfaceContainerHighest: appbarColorLight,
    surfaceTint: primaryColor,
    inversePrimary: green,
    onInverseSurface: green,
    inverseSurface: white,
    onTertiaryContainer: blueBlack,
    onSurfaceVariant: blueBlack,
    onSecondaryContainer: offWhite,
    onPrimaryContainer: green,
    outlineVariant: orange,
    tertiaryContainer: gray,
  );
}
