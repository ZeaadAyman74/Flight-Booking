import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AnimatedIndicator extends StatelessWidget {
  const AnimatedIndicator({super.key, this.color,this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color ?? ColorsManager.gray,
      size:size?? 60,
    );
  }
}