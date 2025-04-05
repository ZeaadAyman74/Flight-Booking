import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/time_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartureAndArrivalTime extends StatelessWidget {
  const DepartureAndArrivalTime(
      {super.key, required this.departureTime, required this.arrivalTime,required this.duration});

  final String? departureTime;
  final String? arrivalTime;
  final String? duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimeInfoWidget(
            title: context.localization.departure, time: departureTime),
        Column(
          children: [
            if(duration!=null)
            Text(duration!, style: context.textTheme.bodySmall),
            Icon(Icons.airplanemode_active, size: 20.w),
          ],
        ),
        TimeInfoWidget(title: context.localization.arrival, time: arrivalTime)
      ],
    );
  }
}
