import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_form/departure_field.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_form/destination_field.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_form/flight_date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SearchCubit>().formKey,
      child: Container(
        decoration: BoxDecoration(
          color: context.themeData.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.themeData.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        margin:EdgeInsets.only(bottom: 32.h),
        padding:  EdgeInsets.all(20.w),
        child: Column(
          children: [
            DepartureField(key:const Key("departureFieldKey"),),
            DestinationField(key:const Key("destinationFieldKey"),),
            FlightDateField(key:const Key("dateFieldKey"),)
          ],
        ),
      ),
    );
  }
}
