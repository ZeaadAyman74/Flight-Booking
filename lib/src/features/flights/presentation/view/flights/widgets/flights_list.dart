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
    return CustomAnimatedWidget(
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => FlightCard(
                flight: flights[index],
              ),
          separatorBuilder: (context, index) => 10.verticalSpace,
          itemCount: flights.length),
    );
  }
}
