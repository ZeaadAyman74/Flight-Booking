import 'package:flight_booking/gen/assets.gen.dart';
import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flight_booking/src/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BookingSuccessDialog extends StatelessWidget {
  const BookingSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(Assets.lottie.success,
                width: context.width, height: 200.h, fit: BoxFit.contain),
            15.verticalSpace,
            Text(context.localization.booking_confirmed,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                )),
            Text(context.localization.have_save_and_pleasant_journey,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            20.verticalSpace,
            CustomButton(
              title: context.localization.ok,
              backgroundColor: ColorsManager.secondaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
