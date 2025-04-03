import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_card/departure_field.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_card/destination_field.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_card/flight_date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

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
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        margin:EdgeInsets.only(bottom: 32.h),
        padding:  EdgeInsets.all(20.w),
        child: Column(
          children:const [
            DepartureField(),
            DestinationField(),
            FlightDateField()
          ],
        ),
      ),
    );
  }
}
