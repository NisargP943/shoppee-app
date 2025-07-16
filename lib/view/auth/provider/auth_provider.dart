import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoppe/data/modules/auth_api.dart';
import 'package:shoppe/model/login_response_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthApi authApi = AuthApi();
  String errorMessage = "";
  LoginResponseModel loginResponseModel = LoginResponseModel();
  Map<String, dynamic> dbData = {};

  Future<LoginResponseModel> loginApi(String username, String password) async {
    try {
      final authResp = await authApi.loginApi(username, password);
      loginResponseModel = loginResponseModelFromJson(
        jsonEncode(authResp.data),
      );
      log("api success");
    } catch (e) {
      errorMessage = e.toString();
      log(e.toString());
    }
    notifyListeners();
    return loginResponseModel;
  }
}
