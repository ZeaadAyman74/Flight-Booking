import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/features/booking/presentation/view/screens/booking_body.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final FlightModel flight;

  const BookingScreen({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar().withDivider('Complete Your Booking'),
      body: BookingBody(flight: flight,),
    );
  }
}