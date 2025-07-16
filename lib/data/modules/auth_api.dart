import 'package:dio/dio.dart';
import 'package:shoppe/data/api_service.dart';

class AuthApi {
  final dio = DioClient().dio;
  Future<Response<dynamic>> loginApi(String username, String password) async {
    final authResp = await dio.post(
      "/auth/login",
      data: {"username": username, "password": password},
    );
    return authResp;
  }
}
