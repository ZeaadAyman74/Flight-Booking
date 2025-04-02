import 'package:flight_booking/src/core/di/di.dart';
import 'package:flight_booking/src/core/utils/bloc_observer.dart';
import 'package:flight_booking/src/root/flight_booking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection().init();
  await ScreenUtil.ensureScreenSize();
   Bloc.observer = MyBlocObserver();
  runApp(const FlightBookingApp());
}

