import 'package:equatable/equatable.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';

class FlightsResponseModel extends Equatable {
  final List<FlightModel> flights;

  const FlightsResponseModel({required this.flights});

  factory FlightsResponseModel.fromJson(Map<String, dynamic> json) {
    return FlightsResponseModel(
        flights: json['flights'] != null
            ? List<FlightModel>.from(
                json['flights'].map((x) => FlightModel.fromJson(x)))
            : []);
  }

  factory FlightsResponseModel.dummy() {
    return FlightsResponseModel(
        flights: List.generate(
      20,
      (index) => FlightModel.dummy(),
    ));
  }

  @override
  List<Object?> get props => [flights];
}
