import 'package:flight_booking/gen/assets.gen.dart';
import 'package:flight_booking/src/core/utils/enums.dart';
import 'package:flight_booking/src/core/widgets/animated_error_widget.dart';
import 'package:flight_booking/src/core/widgets/animated_progress_indicator.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/flights_bloc/flights_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/empty_flights_widget.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flights_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightsBody extends StatelessWidget {
  const FlightsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightsCubit, FlightsState>(
        builder: (context, state) {
          if (state.flightsState == RequestState.loading &&
              state.flights.isEmpty) {
            return const Center(child: AnimatedIndicator());
          }
          if (state.flightsState == RequestState.error && state.flights.isEmpty) {
            return Center(
              child: AnimatedErrorWidget(
                lottieFilePath: Assets.lottie.error,
                message: state.errorMessage,
                onRetry: () {
                  context.read<FlightsCubit>().getSuccessFlights();
                },
              ),
            );
          }
          if (state.flightsState == RequestState.success &&
              state.flights.isEmpty) {
            return const EmptyFlightsWidget();
          }

          return  FlightsList(flights: state.flights,);
        });
  }
}
