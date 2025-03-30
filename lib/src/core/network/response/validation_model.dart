import 'package:equatable/equatable.dart';

class ValidationModel extends Equatable {
  const ValidationModel({
    this.fcm,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.gender,
    this.code,
    this.currentPassword,
    this.newPassword,
    this.date,
    this.content,
  });

  final String? fcm;
  final String? email;
  final String? firstName;
  final String? gender;
  final String? code;
  final String? lastName;
  final String? password;
  final String? currentPassword;
  final String? newPassword;
  final String? date;
  final String? content;

  factory ValidationModel.fromJson(Map<String, dynamic> json) {
    return ValidationModel(
      fcm: json["FCM"],
      email: json["email"],
      password: json["password"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      gender: json["gender"],
      code: json["code"],
      currentPassword: json["current_password"],
      newPassword: json["new_password"],
      date: json['date'],
      content: json['content'],
    );
  }

  @override
  List<Object?> get props =>
      [fcm, email, password, firstName, lastName, gender, code, currentPassword, newPassword,date,content];
}
