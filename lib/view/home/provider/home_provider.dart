import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoppe/data/modules/products_api.dart';
import 'package:shoppe/model/product_response_model.dart';

class HomeProvider extends ChangeNotifier {
  final ProductsApi productsApi = ProductsApi();
  bool loading = false;
  List<ProductsResponseModel> productsResponseModel = [ProductsResponseModel()];
  List<String?> productCategory = [];

  ///Products api
  Future getAllProducts() async {
    try {
      loading = true;
      final resp = await productsApi.getAllProducts();
      if (resp.statusCode == 200) {
        log("api success");
        productsResponseModel = productsResponseModelFromJson(
          jsonEncode(resp.data),
        );
        productCategory = productsResponseModel.map((e) => e.title).toList();
        loading = false;
      }
    } on DioException catch (d) {
      log("${d.message}");
      loading = false;
    }
    notifyListeners();
  }
}
