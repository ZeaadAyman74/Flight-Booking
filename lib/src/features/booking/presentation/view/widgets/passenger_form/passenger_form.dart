import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passenger_email_field.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passenger_name_field.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passenger_phone_field.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/passport_num_and_expire_date.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/passenger_form/special_requests_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassengerForm extends StatefulWidget {
  const PassengerForm({super.key});

  @override
  State<PassengerForm> createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            Text(context.localization.passenger_details,
                style: context.textTheme.titleLarge),
            const PassengerNameField(),
            const PassportNumAndExpireDate(),
            const PassengerEmailField(),
            const PassengerPhoneField(),
            const SpecialRequestsField()
          ],
        ),
      ),
    );
  }
}
