import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PriceAndBookButton extends StatelessWidget {
  const PriceAndBookButton({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                NumberFormat.currency(symbol: '\$').format(price),
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
          onPressed: () {},
        )
      ],
    );
  }
}
