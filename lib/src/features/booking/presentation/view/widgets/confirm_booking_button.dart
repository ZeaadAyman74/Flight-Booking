import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_button.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmBookingButton extends StatelessWidget {
  const ConfirmBookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: context.localization.confirm_booking,
      onPressed: () {
        if(context.read<BookingCubit>().formKey.currentState!.validate()){
          context.read<BookingCubit>().bookFlight();
        }
      },
    );
  }
}
