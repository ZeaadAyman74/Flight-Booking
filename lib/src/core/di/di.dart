import 'package:dio/dio.dart';
import 'package:flight_booking/src/core/network/dio/dio_factory.dart';
import 'package:flight_booking/src/features/flights/data/data_source/remote/flights_api_service.dart';
import 'package:flight_booking/src/features/flights/data/repos/flights_repo.dart';
import 'package:flight_booking/src/features/flights/domain/repos/base_flights_repo.dart';
import 'package:flight_booking/src/features/flights/domain/usecases/get_flights_usecase.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/flights_bloc/flights_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  void init() {
    //------------------------ Core --------------------------------------------
    getIt.registerLazySingleton<Dio>(
      () => DioFactory.getDio(),
    );

    //---------------------- Api Services --------------------------------------

    getIt.registerFactory<FlightsApiService>(
      () => FlightsApiService(getIt()),
    );

    //---------------------- Repos ---------------------------------------------
    getIt.registerFactory<BaseFlightsRepo>(
          () => FlightsRepo(getIt()),
    );

    //---------------------- use case ------------------------------------------

    getIt.registerFactory<GetFlightsUseCase>(
          () => GetFlightsUseCase(getIt()),
    );

    //---------------------- Bloc ---------------------------------------------
    getIt.registerFactory<FlightsCubit>(
          () => FlightsCubit(getIt()),
    );

    getIt.registerFactory<SearchCubit>(
          () => SearchCubit(),
    );

  }
}
