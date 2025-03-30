import 'package:dio/dio.dart';
import 'package:flight_booking/src/core/network/constants/api_constants.dart';
import 'package:flight_booking/src/core/network/constants/api_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptor.dart';

class DioFactory {
  static  Dio? _dio;
  Dio getDio() {
    _dio ??= Dio();

    const int timeout = 10 * 1000;

    Map<String, String> headers = {
      ApiKeys.contentType: ApiKeys.applicationJson,
      ApiKeys.accept: ApiKeys.applicationJson,
    };

    _dio!.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: timeout),
      receiveTimeout: const Duration(seconds: timeout),
      headers: headers,
    );

    _dio!.interceptors.addAll([
      DioInterceptor(),
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
    ]);

    return _dio!;
  }
}
