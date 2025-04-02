import 'package:flight_booking/src/core/network/error_handler/network_exceptions.dart';
import 'package:flight_booking/src/core/network/error_handler/network_result.dart';
import 'package:flight_booking/src/features/flights/data/data_source/remote/flights_api_service.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';
import 'package:flight_booking/src/features/flights/domain/repos/base_flights_repo.dart';

class FlightsRepo implements BaseFlightsRepo {
  final FlightsApiService _service;

  FlightsRepo(this._service);

  @override
  Future<NetworkResult<FlightsResponseModel>> getFlights(
      {String? departureCity, String? destinationCity, String? date}) async {
    try {
      final response = await _service.getFlights(
          date: date,
          departureCity: departureCity,
          destinationCity: destinationCity);
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
