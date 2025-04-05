import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/core/utils/app_regex.dart';
import 'package:flight_booking/src/core/widgets/custom_text_field.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassengerPhoneField extends StatelessWidget {
  const PassengerPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: context.localization.phone_number,
      controller: context.read<BookingCubit>().phoneNumberController,
      withBorder: false,
      keyboardType: TextInputType.phone,
      prefixIcon: Icon(
        Icons.phone,
        size: 20.w,
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return context.localization.required_field;
        }
        if (AppRegex.isNumber(value!)) {
          return context.localization.enter_valid_phone_number;
        }
        return null;
      },
    );
  }
}
