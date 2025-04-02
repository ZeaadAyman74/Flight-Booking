import 'package:flight_booking/src/core/network/error_handler/network_result.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';
import 'package:flight_booking/src/features/flights/domain/repos/base_flights_repo.dart';

class GetFlightsUseCase {
  GetFlightsUseCase(this._flightsRepo);

  final BaseFlightsRepo _flightsRepo;

//----------------------------------------------------------

  Future<NetworkResult<FlightsResponseModel>> call(
      {String? departureCity, String? destinationCity, String? date}) async {
    return _flightsRepo.getFlights(
        destinationCity: destinationCity,
        departureCity: departureCity,
        date: date);
  }
}
