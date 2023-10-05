import 'package:dio/dio.dart';

class ApiCallHelper {
  factory ApiCallHelper() {
    return singleton;
  }
  ApiCallHelper._();
  static final ApiCallHelper singleton = ApiCallHelper._();

  static final BaseOptions _options = BaseOptions(
    baseUrl: '',
    connectTimeout: const Duration(seconds: 30),
  );

  static final Dio _dio = Dio(_options);

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
    String? apiVersion,
  }) =>
      _apiRequestCall(
        "GET",
        url,
        queryParams: queryParams,
        cancelToken: cancelToken,
      );

  Future<Response> _apiRequestCall(
    String method,
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response networkResponse = await _dio.request(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(method: method),
        cancelToken: cancelToken,
      );

      return networkResponse;
    } catch (e, _) {
      rethrow;
    }
  }

  void clearHeaders() {
    _dio.options.headers.clear();
  }
}
