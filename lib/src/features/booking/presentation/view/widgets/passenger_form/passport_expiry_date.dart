import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PassportExpiryDate extends StatelessWidget {
  const PassportExpiryDate({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime now = DateTime.now();
        final date = await showDatePicker(
          context: context,
          initialDate: now,
          firstDate: now,
          lastDate: now.add(const Duration(days: 365)),
        );
        if (date != null && context.mounted) {
          context.read<BookingCubit>().changePassportExpireDate(date);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: context.localization.expiry_date,
            prefixIcon: Icon(
              Icons.calendar_today,
              size: 20.w,
            )),
        child: BlocBuilder<BookingCubit, BookingState>(
          buildWhen: (previous, current) => current.passportExpireDate != previous.passportExpireDate,
          builder: (context, state) {
            DateTime? expiryDate=state.passportExpireDate;
            return Text(
              expiryDate != null
                  ? DateFormat.yMd().format(expiryDate)
                  : context.localization.select_date,
              style: context.textTheme.titleSmall,
            );
          },
        ),
      ),
    );
  }
}
