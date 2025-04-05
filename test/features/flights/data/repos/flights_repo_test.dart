import 'package:dio/dio.dart';
import 'package:flight_booking/src/core/network/connection_info.dart';
import 'package:flight_booking/src/core/network/constants/api_constants.dart';
import 'package:flight_booking/src/core/network/error_handler/network_exceptions.dart';
import 'package:flight_booking/src/core/network/error_handler/network_result.dart';
import 'package:flight_booking/src/core/network/response/general_response_model.dart';
import 'package:flight_booking/src/features/flights/data/data_source/remote/flights_api_service.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/data/repos/flights_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'flights_repo_test.mocks.dart';

// Generate the mock class
@GenerateNiceMocks([
  MockSpec<FlightsApiService>(),
  MockSpec<NetworkInfo>(),
])
void main() {
  late FlightsRepo flightsRepo;
  late MockFlightsApiService mockFlightsApiService;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockFlightsApiService = MockFlightsApiService();
    mockNetworkInfo = MockNetworkInfo();
    flightsRepo = FlightsRepo(mockFlightsApiService, mockNetworkInfo);
  });

  group(
    "Test get Flights data in flights repo",
    () {

      test('Should return NetworkResult<FlightsResponseModel>.success',
          () async {
        // Arrange (Mock API response)
        FlightModel flightModel = FlightModel(
            id: 1,
            airline: "Egypt Air",
            flightNumber: "0054",
            departureTime: "10:00 AM",
            arrivalTime: "2:00 PM",
            price: 300.0);
        List<FlightModel> flights = List.generate(
          5,
          (index) => flightModel,
        );
        FlightsResponseModel flightsResponse =
            FlightsResponseModel(flights: flights);

        SearchQueryModel mockQuery = SearchQueryModel(
            destination: "Alexandria",
            departure: "Cairo",
            date: DateTime.now());

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockFlightsApiService.getFlights(searchQueries: mockQuery.toMap()))
            .thenAnswer((_) async => flightsResponse);

        // Act (Call the method)
        final result = await flightsRepo.getFlights(searchQuery: mockQuery);

        // Assert (Check the result)
        expect(result, NetworkResult.success(flightsResponse));

        verify(mockFlightsApiService.getFlights(
                searchQueries: mockQuery.toMap()))
            .called(1);
      });


      test('Should return NetworkResult<FlightsResponseModel>.failure(NotFound())',
          () async {
        // Arrange
        SearchQueryModel mockQuery = SearchQueryModel(
            destination: "Alexandria",
            departure: "Cairo",
            date: DateTime.now());

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockFlightsApiService.getFlights(searchQueries: mockQuery.toMap()))
            .thenThrow(DioException(
          response: Response(
            data:GeneralResponseModel(message: "Not Found", success: false).toJson() ,
            statusCode: 302,
              requestOptions: RequestOptions(
            queryParameters: mockQuery.toMap(),
            path: ApiConstants.flights,
            baseUrl: ApiConstants.baseUrl,
            method: 'GET',
          )),
          requestOptions: RequestOptions(
            queryParameters: mockQuery.toMap(),
            path: ApiConstants.flights,
            baseUrl: ApiConstants.baseUrl,
            method: 'GET',
          ),
        ));

        // Act
        final result = await flightsRepo.getFlights(searchQuery: mockQuery);

        // Assert
        expect(
            result,
            NetworkResult<FlightsResponseModel>.failure(
                NetworkExceptions.notFound("Not Found",null)));
      });

      test(
          'Should return NetworkResult<FlightsResponseModel>.failure(NoInternetConnection())',
          () async {
        // Arrange
        SearchQueryModel mockQuery = SearchQueryModel(
            destination: "Alexandria",
            departure: "Cairo",
            date: DateTime.now());
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockFlightsApiService.getFlights(searchQueries: mockQuery.toMap()))
            .thenThrow(NetworkExceptions.noInternetConnection());

        // Act
        final result = await flightsRepo.getFlights(searchQuery: mockQuery);

        // Assert
        expect(
            result,
            NetworkResult<FlightsResponseModel>.failure(
                NetworkExceptions.noInternetConnection()));
      });
    },
  );
}
