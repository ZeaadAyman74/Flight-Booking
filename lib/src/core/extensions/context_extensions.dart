import 'dart:io';
import 'package:flight_booking/l10n/app_localizations.dart';
import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension BuildContextExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get themeData => Theme.of(this);

  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void popDialog() => Navigator.of(this, rootNavigator: true).pop();

  void pop() => Navigator.of(this).pop();

  Future<Object?> push(String routeName, {Object? args}) =>
      Navigator.of(this, rootNavigator: true)
          .pushNamed(routeName, arguments: args);

  void pushReplacement(String routeName, {Object? args}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: args);

  void pushAndRemove(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false,
          arguments: args);

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double get topPadding => MediaQuery.of(this).viewPadding.top;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  void showMessageDialog({Key? key,String? title, required String message}) {
    if (Platform.isAndroid) {
      showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            key: key,
            title: title != null
                ? Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),
            )
                : null,
            content: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
            elevation: 5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: this,
        builder: (context) => CupertinoAlertDialog(
          key:key,
          title: Text(message,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600)),
          insetAnimationCurve: Curves.ease,
          insetAnimationDuration: const Duration(microseconds: 600),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Ok',
                  style: TextStyle(
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.w600)),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      );
    }
  }
}
