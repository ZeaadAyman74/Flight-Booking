import 'package:flight_booking/src/core/network/error_handler/network_result.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/domain/repos/base_flights_repo.dart';

class GetFlightsUseCase {
  GetFlightsUseCase(this._flightsRepo);

  final BaseFlightsRepo _flightsRepo;

//----------------------------------------------------------

  Future<NetworkResult<FlightsResponseModel>> call(
      {SearchQueryModel? searchQuery}) async {
    return _flightsRepo.getFlights(searchQuery: searchQuery);
  }
}
