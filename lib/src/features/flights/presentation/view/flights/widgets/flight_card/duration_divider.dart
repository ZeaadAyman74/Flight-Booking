import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DurationDivider extends StatelessWidget {
  const DurationDivider({super.key,required this.duration});
final String? duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
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
                          height: 1.h,
                          margin:
                           EdgeInsets.symmetric(horizontal: 1.w),
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
                size: 20.w,
              ),
            ],
          ),
          SizedBox(height: 4.h),
         if(duration != null)
          Text(
            duration!,
            style: context.themeData.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
