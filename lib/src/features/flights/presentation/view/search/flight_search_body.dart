import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_button.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/search_card/search_card.dart';
import 'package:flight_booking/src/features/flights/presentation/view/search/widgets/title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightSearchBody extends StatelessWidget {
  const FlightSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAndSubtitle(),
          SearchCard(),
          SearchButton()
        ],
      ),
    );
  }
}
