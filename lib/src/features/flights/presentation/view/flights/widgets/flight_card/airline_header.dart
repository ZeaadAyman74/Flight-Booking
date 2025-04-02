import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AirlineHeader extends StatelessWidget {
  const AirlineHeader(
      {super.key, required this.airline, required this.flightNumber});

  final String? airline;
  final String? flightNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color:
                  context.themeData.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: 8.br,
            ),
            child: Text(
              airline?.substring(0, 2) ?? 'FL',
              style: context.themeData.textTheme.titleLarge?.copyWith(
                color: context.themeData.primaryColor,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(airline ?? 'Unknown Airline',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium),
                Text(
                  'Flight $flightNumber',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.themeData.colorScheme.onSurface
                        .withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
