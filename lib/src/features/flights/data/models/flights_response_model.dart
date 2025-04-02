import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';

class FlightsResponseModel {
  List<FlightModel> flights;

  FlightsResponseModel({required this.flights});

  factory FlightsResponseModel.fromJson(Map<String, dynamic> json) {
    return FlightsResponseModel(
        flights: List.generate(
      20,
      (index) => FlightModel.dummy(),
    ));
  }
}
