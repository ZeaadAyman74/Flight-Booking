import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_text_field.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassengerEmailField extends StatelessWidget {
  const PassengerEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: context.localization.email,
      withBorder: false,
      controller: context.read<BookingCubit>().emailController,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        Icons.email,
        size: 20.w,
      ),
      validator: (value) => value!.isEmpty ? context.localization.required_field : null,
    );
  }
}
