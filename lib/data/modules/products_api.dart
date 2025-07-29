import 'package:shoppe/data/api_service.dart';

class ProductsApi {
  final dio = DioClient().dio;

  Future getAllProducts() async {
    final authResp = await dio.get("https://fakestoreapi.com/products");
    return authResp;
  }
}
