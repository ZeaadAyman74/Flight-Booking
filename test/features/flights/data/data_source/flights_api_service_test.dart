import 'package:dio/dio.dart';
import 'package:flight_booking/src/core/network/constants/api_constants.dart';
import 'package:flight_booking/src/features/flights/data/data_source/remote/flights_api_service.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flight_booking/src/features/flights/data/models/flights_response_model.dart';

import 'flights_api_service_test.mocks.dart';

// Generate nice mocks with all methods stubbed
@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late FlightsApiService apiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();

    // Stub the base options
    when(mockDio.options).thenReturn(BaseOptions(
      baseUrl: 'https://mock-api.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    apiService = FlightsApiService(mockDio);
  });

  DioException createDioException({
    required DioExceptionType type,
    int? statusCode,
    String? message,
  }) {
    return DioException(
      type: type,
      error: message ?? 'Mock Error',
      requestOptions: RequestOptions(path: ApiConstants.flights),
      response: statusCode != null
          ? Response(
        statusCode: statusCode,
        requestOptions: RequestOptions(path: ApiConstants.flights),
      )
          : null,
    );
  }
  //----------------------------------------------------------------------------

  group('getFlights', () {

    final mockResponse = FlightsResponseModel(flights: [
      FlightModel(
        id: 1,
        airline: 'Air XYZ',
        flightNumber: 'XYZ123',
        departureTime: '10:00 AM',
        arrivalTime: '2:30 PM',
        duration: '4h 30m',
        price: 300.0,
      ),
    ]);
    //----------------------------------------------------------------------------

    test('successfully returns flights on 200 response', () async {
      // Arrange
      final mockQuery = SearchQueryModel(
          destination: "Alexandria", departure: "Cairo", date: DateTime.now());

      when(mockDio.fetch<Map<String, dynamic>>(any)).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          data: {
            "flights": [
              {
                "id": 1,
                "airline": "Air XYZ",
                "flight_number": "XYZ123",
                "departure": "10:00 AM",
                "arrival": "2:30 PM",
                "price": 300.0,
              }
            ]
          },
          statusCode: 200,
          requestOptions: RequestOptions(
            path: ApiConstants.flights,
            baseUrl: ApiConstants.baseUrl,
            method: 'GET',
            queryParameters: mockQuery.toMap(),
          ),
        ),
      );

      // Act
      final result = await apiService.getFlights(
        searchQueries: mockQuery.toMap(),
      );

      // Assert
      expect(result, mockResponse);
      verify(mockDio.fetch<Map<String, dynamic>>(any)).called(1);
    });

    //----------------------------------------------------------------------------

    test('throws connectionTimeout DioException', () async {
      when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(
        createDioException(type: DioExceptionType.connectionTimeout),
      );

      expect(
            () => apiService.getFlights(),
        throwsA(isA<DioException>().having((e) => e.type, 'type', DioExceptionType.connectionTimeout)),
      );
    });

    test('throws sendTimeout DioException', () async {
      when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(
        createDioException(type: DioExceptionType.sendTimeout),
      );

      expect(
            () => apiService.getFlights(),
        throwsA(isA<DioException>().having((e) => e.type, 'type', DioExceptionType.sendTimeout)),
      );
    });

    test('throws receiveTimeout DioException', () async {
      when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(
        createDioException(type: DioExceptionType.receiveTimeout),
      );

      expect(
            () => apiService.getFlights(),
        throwsA(isA<DioException>().having((e) => e.type, 'type', DioExceptionType.receiveTimeout)),
      );
    });

    test('throws badResponse DioException', () async {
      when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(
        createDioException(type: DioExceptionType.badResponse, statusCode: 500),
      );

      expect(
            () => apiService.getFlights(),
        throwsA(isA<DioException>().having((e) => e.type, 'type', DioExceptionType.badResponse)),
      );
    });

    test('throws cancel DioException', () async {
      when(mockDio.fetch<Map<String, dynamic>>(any)).thenThrow(
        createDioException(type: DioExceptionType.cancel),
      );

      expect(
            () => apiService.getFlights(),
        throwsA(isA<DioException>().having((e) => e.type, 'type', DioExceptionType.cancel)),
      );
    });
  });
}
