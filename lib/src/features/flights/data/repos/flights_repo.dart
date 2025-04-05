import 'package:flight_booking/src/core/network/connection_info.dart';
import 'package:flight_booking/src/core/network/error_handler/network_exceptions.dart';
import 'package:flight_booking/src/core/network/error_handler/network_result.dart';
import 'package:flight_booking/src/features/flights/data/data_source/remote/flights_api_service.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/domain/repos/base_flights_repo.dart';

class FlightsRepo implements BaseFlightsRepo {
  final FlightsApiService _service;
  final NetworkInfo networkInfo;

  FlightsRepo(this._service,this.networkInfo);

  @override
  Future<NetworkResult<FlightsResponseModel>> getFlights(
      {SearchQueryModel? searchQuery}) async {
    if(!(await networkInfo.isConnected)){
      return NetworkResult.failure(NetworkExceptions.noInternetConnection());
    }
    try {
      final response =
      await _service.getFlights(searchQueries: searchQuery?.toMap());
      return NetworkResult.success(response);
    } catch (error) {
      return NetworkResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
