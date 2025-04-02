import 'package:equatable/equatable.dart';

class FlightModel extends Equatable {
  final int id;
  final String? airline;
  final String? flightNumber;
  final String? departureTime;
  final String? arrivalTime;
  final double? price;

  const FlightModel(
      {required this.id,
      required this.airline,
      required this.flightNumber,
      required this.departureTime,
      required this.arrivalTime,
      required this.price});

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
        id: json['id'],
        airline: json['airline'],
        flightNumber: json['flight_number'],
        departureTime: json['departure'],
        arrivalTime: json['arrival'],
        price: json['price']);
  }

  factory FlightModel.dummy() => FlightModel(
      id: 1,
      airline: "Egypt Air",
      flightNumber: "0054",
      departureTime: "10:00 AM",
      arrivalTime: "2:00 PM",
      price: 300.0);

  @override
  List<Object?> get props =>
      [id, flightNumber, departureTime, arrivalTime, price];
}
