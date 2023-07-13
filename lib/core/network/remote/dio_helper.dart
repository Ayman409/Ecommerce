import 'package:dio/dio.dart';

const baseUrl = 'https://student.valuxapps.com/api/';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ));
  }

  static Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      String? lang = 'en',

      String? userToken}) async {
    _dio.options.headers = {
      //Headers.contentTypeHeader: Headers.jsonContentType,
      'lang' : lang,
      'Content-Type' : 'application/json',
      'authorization': userToken
    };
    
    return await _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? userToken,
    String? langCode,
  }) async {
    _dio.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      'authorization': userToken
    };

    return await _dio.post(path, queryParameters: queryParameters, data: data);
  }

  static Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Object? data,
    String? userToken,
  }) async {
    _dio.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      'authorization': userToken
    };

    return await _dio.put(path, queryParameters: queryParameters, data: data);
  }

  static Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    String? userToken,
  }) async {
    _dio.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      'authorization': userToken
    };
    return await _dio.delete(path, queryParameters: queryParameters, data: {});
  }
}
