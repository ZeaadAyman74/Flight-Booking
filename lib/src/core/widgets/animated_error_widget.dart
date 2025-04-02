import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AnimatedErrorWidget extends StatelessWidget {
  const AnimatedErrorWidget(
      {super.key, required this.lottieFilePath, this.message});

  final String lottieFilePath;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(lottieFilePath,
            width: context.width,
            height: context.height * .4,
            fit: BoxFit.cover,repeat: false),
        10.verticalSpace,
        Text(
          message!,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
