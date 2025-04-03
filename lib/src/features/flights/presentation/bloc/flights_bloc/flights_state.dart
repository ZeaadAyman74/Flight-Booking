part of 'flights_cubit.dart';

class FlightsState extends Equatable {
  final RequestState flightsState;
  final String errorMessage;
  final List<FlightModel> flights;

  const FlightsState(
      {this.flightsState = RequestState.initial,
      this.errorMessage = '',
      required this.flights});

  FlightsState copyWith(
      {RequestState? flightsState,
      String? errorMessage,
      List<FlightModel>? flights}) {
    if (flights != null) {
      this.flights.addAll(flights);
    }
    return FlightsState(
        flightsState: flightsState ?? this.flightsState,
        errorMessage: errorMessage ?? this.errorMessage,
        flights: flights ?? this.flights);
  }

  @override
  List<Object?> get props => [flightsState, errorMessage, flights];
}

