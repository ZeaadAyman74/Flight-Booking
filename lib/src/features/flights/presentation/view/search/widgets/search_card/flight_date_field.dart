import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/features/flights/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FlightDateField extends StatelessWidget {
  const FlightDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          current.selectedDate != previous.selectedDate,
      builder: (context, state) {
        DateTime? selectedDate = state.selectedDate;
        return InkWell(
          onTap: () => _selectDate(context),
          borderRadius: 12.br,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.themeData.colorScheme.outline
                    .withValues(alpha: 0.3),
              ),
              borderRadius: 12.br,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  color: context.themeData.colorScheme.primary,
                  size: 20.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? context.localization.select_travel_date
                        : DateFormat('EEE, MMM d, y').format(selectedDate),
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                if (selectedDate != null)
                  InkWell(
                    onTap: context.read<SearchCubit>().removeSelectedDate,
                    child: Icon(
                      Icons.close_rounded,
                      color: context.themeData.colorScheme.onSurface
                          .withValues(alpha: 0.4),
                      size: 18.w,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: context.themeData.copyWith(
            colorScheme: ColorScheme.light(
              primary: context.themeData.colorScheme.primary,
              onPrimary: context.themeData.scaffoldBackgroundColor,
              surface: context.themeData.scaffoldBackgroundColor,
              onSurface: context.themeData.primaryColorDark,
            ),
            dialogBackgroundColor: context.themeData.scaffoldBackgroundColor,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && context.mounted) {
      context.read<SearchCubit>().selectDate(pickedDate);
    }
  }
}
