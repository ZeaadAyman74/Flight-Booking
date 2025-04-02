import 'package:flight_booking/src/core/network/error_handler/network_result.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';

abstract class BaseFlightsRepo {
  Future<NetworkResult<FlightsResponseModel>> getFlights(
      {String? departureCity, String? destinationCity, String? date});
}
