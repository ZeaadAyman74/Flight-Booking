import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TimeInfoWidget extends StatelessWidget {
  const TimeInfoWidget({super.key,required this.title,required this.time});
final String title;
final String? time;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time ?? '--:--',
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.themeData.colorScheme.onSurface
                .withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
