import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flight_booking/src/core/widgets/animated_progress_indicator.dart';
import 'package:flutter/material.dart';

class DialogIndicator extends StatelessWidget {
  const DialogIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: AnimatedIndicator(
            color: ColorsManager.white,
          )),
    );
  }
}
