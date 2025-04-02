import 'package:flight_booking/gen/assets.gen.dart';
import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyFlightsWidget extends StatelessWidget {
  const EmptyFlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(Assets.lottie.emptyFlights,
            width: context.width,
            height: context.height*.4,
            fit: BoxFit.cover),
        10.verticalSpace,
        Text(context.localization.no_flights_found,style: context.textTheme.bodyMedium,)
      ],
    );
  }
}
