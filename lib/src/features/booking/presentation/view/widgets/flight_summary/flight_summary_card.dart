import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/flight_summary/airline_widget.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/flight_summary/departure_and_arrival_time.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/flight_summary/summary_total_price.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightSummary extends StatelessWidget {
  const FlightSummary({super.key, required this.flight});

  final FlightModel flight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 14.w,),
      margin: EdgeInsets.only(bottom: 30.h),
      decoration: BoxDecoration(
        color: context.themeData.cardColor,
        borderRadius: 15.br,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(3, 1),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(-3, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          AirlineWidget(
            airlineName: flight.airline,
            flightNumber: flight.flightNumber,
          ),
          DepartureAndArrivalTime(
              departureTime: flight.departureTime,
              arrivalTime: flight.arrivalTime,duration: flight.duration,),
          Divider(height: 30.h),
          SummaryTotalPrice(price: flight.price)
        ],
      ),
    );
  }
}
