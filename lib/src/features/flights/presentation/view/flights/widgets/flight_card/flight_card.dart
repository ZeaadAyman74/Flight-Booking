import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/airline_header.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/flight_timeline.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/price_and_book_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightCard extends StatelessWidget {
  final FlightModel flight;

  const FlightCard({
    super.key,
    required this.flight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
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
          AirlineHeader(
            airline: flight.airline,
            flightNumber: flight.flightNumber,
          ),
          FlightTimeline(
            departureTime: flight.departureTime,
            arrivalTime: flight.arrivalTime,
            duration: flight.duration,
          ),
          PriceAndBookButton(flight: flight),
        ],
      ),
    );
  }

}
