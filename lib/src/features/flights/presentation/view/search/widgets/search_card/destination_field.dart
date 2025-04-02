import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_text_field.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationField extends StatelessWidget {
  const DestinationField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: CustomTextField(
        controller: context.read<SearchCubit>().destinationController,
        labelText: context.localization.to,
        prefixIcon: Icon(Icons.flight_land_rounded,color: context.themeData.primaryColor,),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return context.localization.please_enter_destination_city;
          }
          if (value == context.read<SearchCubit>().departureController.text) {
            return context.localization.destination_must_be_different;
          }
          return null;
        },
      ),
    );
  }
}
