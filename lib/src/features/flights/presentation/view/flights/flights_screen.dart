import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/flights_bloc/flights_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/flights_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightsScreen extends StatefulWidget {
  const FlightsScreen({super.key, required this.searchQueryModel});

  final SearchQueryModel searchQueryModel;

  @override
  State<FlightsScreen> createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  FlightsCubit get cubit => context.read<FlightsCubit>();

  @override
  void initState() {
    cubit.getMockFlights();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.lightBlue,
      appBar: AppBar().withDivider(context.localization.flights),
      body: FlightsBody(),
    );
  }
}
