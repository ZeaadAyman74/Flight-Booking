import 'dart:math';
import 'dart:developer' as dev;
import 'package:flight_booking/src/core/widgets/app_bar_divider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringExtension on String? {
  String capitalize() {
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }

  bool get isNullOrEmpty => !(this != null && this!.isNotEmpty);
}

extension UIExtension on num {
  ///* Return [BorderRadius] for widget
  BorderRadius get br => BorderRadius.circular(toDouble().r);

  ///* Return [Radius] for widget
  Radius get rBr => Radius.circular(toDouble());

  ///* Subtract date
  DateTime get sDate => DateTime.now().subtract(Duration(days: toInt()));

  ///* Subtract date
  DateTime get aDate => DateTime.now().add(Duration(days: toInt()));

  double toPrecision(int fractionDigits) {
    double mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}

//******************************************************************************
extension TextExtention on TextEditingController {
  ///* Return `String` after trim text from controller
  String get trimText => text.trim();

  ///* Return `int` from controller text
  int toInt() => int.tryParse(text) ?? 0;

  ///* Return `double` from controller text
  double toDouble() => double.tryParse(text) ?? 0;
}

//******************************************************************************

extension AppBarExtension on AppBar {
  ///* Return `AppBar` with divider
  AppBar withDivider(String title, {bool withBackIcon=true, List<Widget>? actions}) {
    return AppBar(
      forceMaterialTransparency: true,
      title: Text(title),
      // leading: withBackIcon?const AppBackButton():const SizedBox.shrink(),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h), // Height of the border
        child: const AppBarDivider(),
      ),
    );
  }
}
//******************************************************************************

///* Print in log shortcuts `log()`
printMeLog(dynamic data) {
  if (kDebugMode) {
    dev.log(data.toString(), time: DateTime.now());
  }
}

//******************************************************************************
///* Print shortcuts `print()`
printMe(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
}
