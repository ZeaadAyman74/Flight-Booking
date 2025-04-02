import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.where_would_you_like_to_fly,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
         4.verticalSpace,
        Text(
         context.localization.search_for_best_flight_deals,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.themeData.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
         28.verticalSpace,
      ],
    );
  }
}
