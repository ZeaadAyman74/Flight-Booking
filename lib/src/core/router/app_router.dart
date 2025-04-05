import 'package:flight_booking/src/core/di/di.dart';
import 'package:flight_booking/src/core/router/routes.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flight_booking/src/features/booking/presentation/view/screens/booking_screen.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flight_booking/src/features/flights/data/models/search_query_model.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/flights_bloc/flights_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/flights/flights_screen.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/flight_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.search ,
    routes: [
      GoRoute(
          path: Routes.search,
          name: Routes.search,
          pageBuilder: (context, state) =>
              AppTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) => getIt<SearchCubit>(),
                  child: FlightSearchScreen(),
                ),
              )),

      //---------------------------------------------------------

      GoRoute(
        path: Routes.flights,
        name: Routes.flights,
        pageBuilder: (context, state) {
          SearchQueryModel searchQuery = SearchQueryModel.fromMap(
              state.uri.queryParameters);
          return AppTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => getIt<FlightsCubit>(),
              child: FlightsScreen(searchQueryModel: searchQuery,),
            ),
          );
        },
      ),
      //---------------------------------------------------------
      GoRoute(
        path: Routes.booking,
        name: Routes.booking,
        pageBuilder: (context, state) {
          FlightModel flight = state.extra as FlightModel;
          return AppTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => getIt<BookingCubit>(),
              child: BookingScreen(flight: flight,),
            ),
          );
        },
      ),
    ],
  );
}

class AppTransitionPage extends CustomTransitionPage {
  const AppTransitionPage({
    required super.child,
    required super.key,
  }) : super(
    transitionsBuilder: _buildTransition,
    transitionDuration: const Duration(milliseconds: 300),
  );

  static Widget _buildTransition(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,) {
    return FadeTransition(opacity: animation, child: child);
  }
}
