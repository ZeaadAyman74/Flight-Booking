import 'validation_model.dart';

class GeneralResponseModel {
  const GeneralResponseModel(
      { required this.message,required this.success, this.validation});

  final String message;
  final bool success;
  final ValidationModel? validation;

  factory GeneralResponseModel.fromJson(Map<String, dynamic> map) {
    return GeneralResponseModel(
        message: map['message'] ?? "",
        success: map['success'] ?? false,
        validation: map['errors'] != null
            ? ValidationModel.fromJson(map['errors'])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'error': message};
  }
}
