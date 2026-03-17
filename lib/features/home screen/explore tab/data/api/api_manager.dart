import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio _dio;

  static const String _apiKey = "40366ca32dca84024cc72b48de9484ad";

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/3",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        queryParameters: {
          "api_key": _apiKey,
        },
      ),
    );

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<Map<String, dynamic>> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      }) async {
    var response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}