import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoppe/data/modules/auth_api.dart';
import 'package:shoppe/model/login_response_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthApi authApi = AuthApi();
  LoginResponseModel? loginResponseModel;
  Map<String, dynamic> dbData = {};

  Future<LoginResponseModel?> loginApi() async {
    try {
      final authResp = await authApi.loginApi('emilys', "emilyspass");
      loginResponseModel = LoginResponseModel.fromJson(
        jsonDecode(authResp.data),
      );
      log("api success");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
    return loginResponseModel;
  }
}
