import 'package:dio/dio.dart';

import '../errors/failures.dart';

abstract class SharedAppUtils {
  static Failure getFailureBasedOnError(DioException  error) {
    if (error.response?.data is String) {
      return ServerFailure();
    }
    if (error.response?.statusCode == 400) {
      return UndefinedFailure();
    }
    if (error.type == DioExceptionType .connectionTimeout ||
        error.type == DioExceptionType .receiveTimeout) {
      return TimeoutFailure();
    }
    if (error.response?.data['message'] != null) {
      return ServerFailure(error.response?.data['message']);
    }
    return ServerFailure();
  }
}
