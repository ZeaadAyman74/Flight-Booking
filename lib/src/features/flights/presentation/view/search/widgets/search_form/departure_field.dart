import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_text_field.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartureField extends StatelessWidget {
  const DepartureField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: CustomTextField(
        controller: context.read<SearchCubit>().departureController,
        labelText: context.localization.from,
        prefixIcon: Icon(Icons.flight_takeoff_rounded,color: context.themeData.primaryColor,size: 20.w,),
        validator: (value) {
          if (value.isNullOrEmpty) {
            return context.localization.please_enter_departure_city;
          }
          return null;
        },
      ),
    );
  }
}
