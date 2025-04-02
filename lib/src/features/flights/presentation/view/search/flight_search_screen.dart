import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/flight_search_body.dart';
import 'package:flutter/material.dart';

class FlightSearchScreen extends StatelessWidget {
  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar().withDivider(context.localization.find_flights),
      body:FlightSearchBody() ,
    );
  }
}