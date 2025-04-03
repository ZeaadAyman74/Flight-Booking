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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 30.h),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 14.w,vertical: 16.h),
        child: Column(
          children: [
            AirlineWidget(
              airlineName: flight.airline!,
            ),
            DepartureAndArrivalTime(
                departureTime: flight.departureTime,
                arrivalTime: flight.arrivalTime),
            Divider(height: 30.h),
            SummaryTotalPrice(price: flight.price)
          ],
        ),
      ),
    );
  }
}
