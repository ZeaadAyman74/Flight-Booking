import 'package:flight_booking/gen/assets.gen.dart';
import 'package:flight_booking/src/core/widgets/animated_error_widget.dart';
import 'package:flight_booking/src/core/widgets/animated_progress_indicator.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/flights_bloc/flights_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/empty_flights_widget.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/widgets/flight_card/flight_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightsList extends StatelessWidget {
  const FlightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightsCubit, FlightsState>(
      builder: (context, state) {
        if (state.flightsState == RequestState.loading &&
            state.flights.isEmpty) {
          return Center(child: AnimatedIndicator());
        }
        if (state.flightsState == RequestState.error && state.flights.isEmpty) {
          return AnimatedErrorWidget(
            lottieFilePath: Assets.lottie.error,
            message: state.errorMessage,
          );
        }
        if (state.flightsState == RequestState.success &&
            state.flights.isEmpty) {
          return EmptyFlightsWidget();
        }
        return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            itemBuilder: (context, index) => FlightCard(
                  flight: state.flights[index],
                ),
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: state.flights.length);
      },
    );
  }
}
