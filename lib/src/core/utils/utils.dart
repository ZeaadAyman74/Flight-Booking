import 'package:intl/intl.dart';

class Utils {
  static  String calculateDuration(String firstTime, String lastTime) {
    final format = DateFormat.jm(); // 'jm' = 10 AM, 2 PM format

    final departureTime = format.parse(firstTime);
    final arrivalTime = format.parse(lastTime);

    // Handle cases where arrival is on the next day
    Duration duration = arrivalTime.difference(departureTime);
    if (duration.isNegative) {
      duration = duration + Duration(days: 1);
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return '${hours}h ${minutes}m';
  }
}