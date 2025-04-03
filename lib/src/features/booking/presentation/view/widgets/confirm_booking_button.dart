import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ConfirmBookingButton extends StatelessWidget {
  const ConfirmBookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: context.localization.confirm_booking,
      onPressed: () {},
    );
  }
}
