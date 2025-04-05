import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flight_booking/src/core/network/error_handler/network_exceptions.dart';
import 'package:flight_booking/src/core/utils/enums.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/domain/usecases/get_flights_usecase.dart';

part 'flights_state.dart';

class FlightsCubit extends Cubit<FlightsState> {
  FlightsCubit(this.getFlightsUseCase)
      : super(FlightsState(flights: [], flightsState: RequestState.initial));
  final GetFlightsUseCase getFlightsUseCase;

  //-----------------------------------------------------------------------

  Future<void> getFlights({SearchQueryModel? searchQuery}) async {
    if (state.flightsState == RequestState.loading && state.flights.isEmpty) {
      return;
    }
    emit(state.copyWith(flightsState: RequestState.loading));
    final result = await getFlightsUseCase(searchQuery: searchQuery);
    result.when(
      success: (data) {
        List<FlightModel> flights = data.flights;
        emit(state.copyWith(
            flightsState: RequestState.success, flights: flights));
      },
      failure: (error) {
        final message = NetworkExceptions.getErrorMessage(error);
        emit(state.copyWith(
            flightsState: RequestState.error, errorMessage: message));
      },
    );
  }
  //-----------------------------------------------------------------------

  Future<void> getSuccessFlights() async {
    if (state.flightsState == RequestState.loading && state.flights.isEmpty) {
      return;
    }
    emit(state.copyWith(flightsState: RequestState.loading));
    Future.delayed(
      Duration(seconds: 1),
      () {
        emit(state.copyWith(
            flightsState: RequestState.success,
            flights: List.generate(
              10,
              (index) => FlightModel.dummy(),
            )));
      },
    );
  }

  Future<void>getEmptyFlights()async{
    if (state.flightsState == RequestState.loading && state.flights.isEmpty) {
      return;
    }
    emit(state.copyWith(flightsState: RequestState.loading));
    Future.delayed(
      Duration(seconds: 1),
          () {
        emit(state.copyWith(
            flightsState: RequestState.success,
            flights: []));
      },
    );
  }

  Future<void>getFlightsWithError()async{
    if (state.flightsState == RequestState.loading && state.flights.isEmpty) {
      return;
    }
    emit(state.copyWith(flightsState: RequestState.loading));
    Future.delayed(
      Duration(seconds: 1),
          () {
        emit(state.copyWith(flightsState: RequestState.error,errorMessage: "Something went wrong, please try again"));
      },
    );
  }
}
