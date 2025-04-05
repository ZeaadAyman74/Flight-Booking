import 'package:equatable/equatable.dart';

class FlightModel extends Equatable {
  final int id;
  final String? airline;
  final String? flightNumber;
  final String? departureTime;
  final String? arrivalTime;
  final double? price;
  final String? duration;

  const FlightModel(
      {required this.id,
      required this.airline,
      required this.flightNumber,
      required this.departureTime,
      required this.arrivalTime,
      required this.price,
      this.duration});

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
        id: json['id'],
        airline: json['airline'],
        flightNumber: json['flight_number'],
        departureTime: json['departure'],
        arrivalTime: json['arrival'],
        duration: "4h 30m",
        price: json['price']);
  }

  factory FlightModel.dummy() => FlightModel(
      id: 1,
      airline: "Egypt Air",
      flightNumber: "0054",
      departureTime: "10:00 AM",
      arrivalTime: "2:30 PM",
      duration: "4h 30m",
      price: 300.0);

  @override
  List<Object?> get props =>
      [id, flightNumber, departureTime, arrivalTime, duration, price];
}
