import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightTimeline extends StatelessWidget {
  const FlightTimeline(
      {super.key, required this.departureTime, required this.arrivalTime});

  final String? departureTime;
  final String? arrivalTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Departure
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                departureTime ?? '--:--',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
               context.localization.departure,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeData.colorScheme.onSurface
                      .withValues(alpha: 0.6),
                ),
              ),
            ],
          ),

          // Flight Duration Visualization
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  // Airplane icon with dotted line
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Dotted line
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: List.generate(
                              (constraints.maxWidth / 4).floor(),
                              (index) => Expanded(
                                child: Container(
                                  height: 1,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  color: context.themeData.colorScheme.onSurface
                                      .withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // Airplane icon
                      Icon(
                        Icons.airplanemode_active,
                        color: context.themeData.colorScheme.primary,
                        size: 20,
                      ),
                    ],
                  ),
                   SizedBox(height: 4.h),
                  // Estimated duration (you could calculate this if you have actual times)
                  Text(
                    '4h 30m',
                    style: context.themeData.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),

          // Arrival
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                arrivalTime ?? '--:--',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
               context.localization.arrival,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.themeData.colorScheme.onSurface
                      .withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
