import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SummaryTotalPrice extends StatelessWidget {
  const SummaryTotalPrice({super.key, required this.price});

  final double? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(context.localization.total_price,
                style: context.textTheme.labelMedium!
                    .copyWith(color: ColorsManager.secondaryColor))),
        Text('\$${price?.toStringAsFixed(2)}',
            style: context.textTheme.titleMedium),
      ],
    );
  }
}
