import 'package:flight_booking/l10n/app_localizations.dart';
import 'package:flight_booking/src/core/router/app_router.dart';
import 'package:flight_booking/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightBookingApp extends StatelessWidget {
  const FlightBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 941),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) =>  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flight Booking',
        theme: lightTheme,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: AppRouter.router,
      ),
    );

  }
}
