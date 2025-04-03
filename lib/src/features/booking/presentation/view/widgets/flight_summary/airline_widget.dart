import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AirlineWidget extends StatelessWidget {
  const AirlineWidget({super.key, required this.airlineName});

  final String airlineName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.airplanemode_active,
              color: context.themeData.primaryColor),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              airlineName,
              style: context.textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
