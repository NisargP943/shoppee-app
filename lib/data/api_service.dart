import 'package:dio/dio.dart';

class DioClient {
  static DioClient? _instance;

  final Dio dio;

  factory DioClient() {
    _instance ??= DioClient._();
    return _instance!;
  }

  DioClient._()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://dummyjson.com',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    // Optional: Add interceptors
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
