import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passport_expiry_date.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passport_number_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassportNumAndExpireDate extends StatelessWidget {
  const PassportNumAndExpireDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        const Expanded(
          child: PassportNumberField(),
        ),
        const Expanded(
          child: PassportExpiryDate(),
        ),
      ],
    );
  }
}
