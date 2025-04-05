import 'package:dio/dio.dart';
import 'package:flight_booking/src/core/network/constants/api_constants.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'flights_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FlightsApiService {
  factory FlightsApiService(Dio dio, {String? baseUrl}) = _FlightsApiService;

  @GET(ApiConstants.flights)
  Future<FlightsResponseModel> getFlights(
      {@Queries() Map<String, dynamic>? searchQueries});
}
