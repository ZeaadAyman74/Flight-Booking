import 'package:flight_booking/src/core/extensions/date_extensions.dart';

class SearchQueryModel {
  final String destination;
  final String departure;
  final DateTime date;

  SearchQueryModel(
      {required this.destination, required this.departure, required this.date});

  factory SearchQueryModel.fromMap(Map<String, dynamic> map) =>
      SearchQueryModel(
          destination: map['to'],
          departure: map['from'],
          date: DateTime.parse(map['date']));

  Map<String,dynamic>toMap()=>{
    'to':destination,
    'from':departure,
    "date":date.toTimeStampFormat
  };
}
