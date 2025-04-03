import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/duration_divider.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/time_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightTimeline extends StatelessWidget {
  const FlightTimeline(
      {super.key, required this.departureTime, required this.arrivalTime});

  final String? departureTime;
  final String? arrivalTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TimeInfoWidget(title: context.localization.departure, time: departureTime),
          // Flight Duration Visualization
          Expanded(
            child: DurationDivider(duration: '4h 30m',)
          ),
          TimeInfoWidget(title: context.localization.arrival, time: arrivalTime),

        ],
      ),
    );
  }
}
