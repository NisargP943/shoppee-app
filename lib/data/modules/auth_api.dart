import 'package:shoppe/data/api_service.dart';

class AuthApi {
  final dio = DioClient().dio;

  Future loginApi(String username, String password) async {
    final authResp = await dio.post(
      "https://dummyjson.com/auth/login",
      data: {"username": username, "password": password},
    );
    return authResp;
  }
}
