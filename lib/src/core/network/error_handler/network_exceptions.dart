import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flight_booking/src/core/network/response/general_response_model.dart';
import 'package:flight_booking/src/core/network/response/validation_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(
      String reason, ValidationModel? validation) = UnauthorizedRequest;

  const factory NetworkExceptions.unauthenticatedRequest(
      String reason, ValidationModel? validation) = UnauthenticatedRequest;

  const factory NetworkExceptions.badRequest(
      String reason, ValidationModel? validation) = BadRequest;

  const factory NetworkExceptions.notFound(
      String reason, ValidationModel? validation) = NotFound;

  const factory NetworkExceptions.methodNotAllowed(
      String reason, ValidationModel? validation) = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable(ValidationModel? validation) =
  NotAcceptable;

  const factory NetworkExceptions.requestTimeout(ValidationModel? validation) =
  RequestTimeout;

  const factory NetworkExceptions.sendTimeout(ValidationModel? validation) =
  SendTimeout;

  const factory NetworkExceptions.receiveTimeout(ValidationModel? validation) =
  RecieveTimeOut;

  const factory NetworkExceptions.conflict(
      String reason, ValidationModel? validation) = Conflict;

  const factory NetworkExceptions.internalServerError(
      String reason, ValidationModel? validation) = InternalServerError;

  const factory NetworkExceptions.notImplemented(ValidationModel? validation) =
  NotImplemented;

  const factory NetworkExceptions.serviceUnavailable(
      ValidationModel? validation) = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException(ValidationModel? validation) =
  FormatException;

  const factory NetworkExceptions.unableToProcess(
      String error, ValidationModel? validation) = UnableToProcess;

  const factory NetworkExceptions.defaultError(
      String error, ValidationModel? validation) = DefaultError;

  const factory NetworkExceptions.unexpectedError(ValidationModel? validation) =
  UnexpectedError;

  static NetworkExceptions handleResponse(Response? response)  {
    GeneralResponseModel? errorModel;
    errorModel = GeneralResponseModel.fromJson(response?.data as Map<String, dynamic>);
    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 302:
        return NetworkExceptions.notFound(
            errorModel.message, errorModel.validation);
      case 400:
        return NetworkExceptions.badRequest(
            errorModel.message, errorModel.validation);
      case 401:
        return NetworkExceptions.unauthorizedRequest(
            errorModel.message, errorModel.validation);
      case 402:
      case 403:
        return NetworkExceptions.methodNotAllowed(
            errorModel.message, errorModel.validation);
      case 404:
        return NetworkExceptions.conflict(
            errorModel.message, errorModel.validation);
      case 409:
        return NetworkExceptions.conflict(
            errorModel.message, errorModel.validation);
      case 408:
        return NetworkExceptions.requestTimeout(errorModel.validation);
      case 422:
        return NetworkExceptions.unableToProcess(
            errorModel.message, errorModel.validation);
      case 500:
        return NetworkExceptions.internalServerError(
            errorModel.message, errorModel.validation);
      case 503:
        return NetworkExceptions.serviceUnavailable(errorModel.validation);
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
            "Received invalid status code: $responseCode",
            errorModel.validation);
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions =
              NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.unknown:
              networkExceptions =
              NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions =
              NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.badResponse:
              networkExceptions =
              NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.badCertificate:
            case DioExceptionType.connectionError:
              networkExceptions =
              NetworkExceptions.handleResponse(error.response);
              break;

            case DioExceptionType.receiveTimeout:
              networkExceptions =
              NetworkExceptions.handleResponse(error.response);
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError(null);
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException(null);
      } catch (_) {
        return const NetworkExceptions.unexpectedError(null);
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess(error.toString(), null);
      } else {
        return const NetworkExceptions.unexpectedError(null);
      }
    }
  }

  static String getErrorMessage(NetworkExceptions exception) {
    var errorMessage = "";
    exception.when(
      notImplemented: (ValidationModel? validation) {
        errorMessage = "";
      },
      unauthenticatedRequest: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      requestCancelled: () {
        errorMessage = "";
      },
      internalServerError: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      notFound: (String reason, ValidationModel? validation) {
        errorMessage = reason;
      },
      serviceUnavailable: (ValidationModel? validation) {
        errorMessage = "";
      },
      methodNotAllowed: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      badRequest: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      unauthorizedRequest: (String reason, ValidationModel? validation) {
        errorMessage = reason;
      },
      unexpectedError: (ValidationModel? validation) {
        errorMessage = "Unexpected error";
      },
      requestTimeout: (ValidationModel? validation) {
        errorMessage = "Request timeout";
      },
      receiveTimeout: (ValidationModel? validation) {
        errorMessage = "Receive timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      sendTimeout: (ValidationModel? validation) {
        errorMessage = "Connection timeout";
      },
      unableToProcess: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      defaultError: (String error, ValidationModel? validation) {
        errorMessage = error;
      },
      formatException: (ValidationModel? validation) {
        errorMessage = "Something went wrong";
      },
      notAcceptable: (ValidationModel? validation) {
        errorMessage = "Not acceptable";
      },
    );
    return errorMessage;
  }

  static ValidationModel? getValidation(NetworkExceptions networkExceptions) {
    ValidationModel? validationModel;
    networkExceptions.when(
      notImplemented: (ValidationModel? validation) {
        validation = validation;
      },
      unauthenticatedRequest: (String error, ValidationModel? validation) {
        validation = validation;
      },
      requestCancelled: () {},
      internalServerError: (String error, ValidationModel? validation) {
        validationModel = validation;
      },
      notFound: (String reason, validation) {
        validationModel = validation;
      },
      serviceUnavailable: (validation) {
        validationModel = validation;
      },
      methodNotAllowed: (String error, validation) {
        validationModel = validation;
      },
      badRequest: (String error, validation) {
        validationModel = validation;
      },
      unauthorizedRequest: (String reason, validation) {
        validationModel = validation;
      },
      unexpectedError: (validation) {
        validationModel = validation;
      },
      requestTimeout: (validation) {
        validationModel = validation;
      },
      receiveTimeout: (validation) {
        validationModel = validation;
      },
      noInternetConnection: () {},
      conflict: (String error, validation) {
        // validationModel = validation;
      },
      sendTimeout: (validation) {
        validationModel = validation;
      },
      unableToProcess: (String error, validation) {
        validationModel = validation;
      },
      defaultError: (String error, validation) {
        validationModel = validation;
      },
      formatException: (validation) {
        validationModel = validation;
      },
      notAcceptable: (validation) {
        validationModel = validation;
      },
    );
    return validationModel;
  }
}
