import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://movies-api.accel.li/api/v2",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
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