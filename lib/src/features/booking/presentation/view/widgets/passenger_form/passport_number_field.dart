import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flight_booking/src/core/utils/app_regex.dart';
import 'package:flight_booking/src/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassportNumberField extends StatelessWidget {
  const PassportNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: context.localization.passport_number,
      keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
      prefixIcon: Icon(
        Icons.credit_card,
        size: 20.w,
      ),
      withBorder: false,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return context.localization.required_field;
        }
        if (AppRegex.isPassportNumber(value!)) {
          return context.localization.enter_valid_passport_number;
        }
        return null;
      }
    );
  }
}
