import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.refresh,
          color: context.themeData.colorScheme.primary,
          size: 24.w,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              context.localization.retry,
              style: context.textTheme.headlineMedium?.copyWith(
               fontSize: 18.sp,),
            )),
      ],
    );
  }
}
