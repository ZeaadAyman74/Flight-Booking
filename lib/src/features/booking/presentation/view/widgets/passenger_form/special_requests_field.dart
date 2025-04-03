import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_text_field.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialRequestsField extends StatelessWidget {
  const SpecialRequestsField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: "${context.localization.special_requests} ${context.localization.optional}",
      controller: context.read<BookingCubit>().specialRequestsController,
      withBorder: false,
      keyboardType: TextInputType.text,
      // maxLines: 3,
      prefixIcon: Icon(
        Icons.note,
        size: 20.w,
      ),
    );  }
}
