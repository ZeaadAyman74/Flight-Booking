import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppBarDivider extends StatelessWidget {
  const AppBarDivider({super.key,this.padding});
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      color: context.themeData.dividerColor, // Border color
      height: 1.0, // Border thickness
    );
  }
}