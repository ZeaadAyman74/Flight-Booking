import 'package:flight_booking/src/features/booking/presentation/view/widgets/booking_bloc_listener.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/confirm_booking_button.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/flight_summary/flight_summary_card.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passenger_form.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({super.key, required this.flight});

  final FlightModel flight;

  @override
  Widget build(BuildContext context) {
    return BookingBlocListener(
      child: SingleChildScrollView(
        padding:  EdgeInsets.all(20.w),
        child: Column(
          children: [
            FlightSummary(flight: flight),
            const PassengerForm(),
            const ConfirmBookingButton(),
          ],
        ),
      ),
    );
  }
}
