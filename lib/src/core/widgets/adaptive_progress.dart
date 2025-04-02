import 'dart:io';
import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'animated_progress_indicator.dart';

class MyProgress extends StatelessWidget {
  const MyProgress({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedIndicator(
      color: ColorsManager.gray.withValues(alpha: .7),
      size: 50,
    );
  }
}

class AdaptiveProgress extends StatelessWidget {
  const AdaptiveProgress({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const Center(
        child: CupertinoActivityIndicator(
          radius: 15,
          color: Colors.white,
        ),
      );
    } else {
      return  Center(
          child: SizedBox(
            height: 25.h,
            width: 25.h,
            child:  CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3.w,
            ),
          ));
    }
  }
}
