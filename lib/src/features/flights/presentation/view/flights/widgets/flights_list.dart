import 'package:flight_booking/src/core/widgets/custom_animation_widget.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/flight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightsList extends StatelessWidget {
  const FlightsList({super.key, required this.flights});

  final List<FlightModel> flights;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        physics: BouncingScrollPhysics(),
        cacheExtent: 5000,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            duration: Duration(milliseconds: 300 + index * 100),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: child,
              ),
            ),
            child: FlightCard(flight: flights[index]),
          );
        },
        separatorBuilder: (context, index) => 10.verticalSpace,
        itemCount: flights.length);
  }
}
