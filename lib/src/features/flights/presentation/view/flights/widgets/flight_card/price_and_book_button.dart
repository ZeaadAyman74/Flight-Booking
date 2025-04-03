import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/router/routes.dart';
import 'package:flight_booking/src/core/widgets/custom_button.dart';
import 'package:flight_booking/src/features/flights/data/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PriceAndBookButton extends StatelessWidget {
  const PriceAndBookButton({super.key, required this.flight});

  final FlightModel flight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.price,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeData.colorScheme.onSurface
                      .withValues(alpha: 0.6),
                ),
              ),
              Text(
                NumberFormat.currency(symbol: '\$').format(flight.price),
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.themeData.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          title: context.localization.book_now,
          width: context.width * .22,
          height: 30,
          borderRadius: 20,
          titleStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp),
          onPressed: () {
            context.pushNamed(Routes.booking,extra: flight);
          },
        )
      ],
    );
  }
}
