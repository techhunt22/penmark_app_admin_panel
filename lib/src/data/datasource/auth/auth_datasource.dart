import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/auth/auth_model.dart';


abstract class AuthApiData {
  Future<AuthModel> login(String email, String password);
}

class AuthApiDataImpl implements AuthApiData {
  final _apiService = Get.find<ApiService>(); // ✅ Gets the singleton instance

  @override
  Future<AuthModel> login(String email, String password) async {
    const String endpoint = ListAPI.login;

    try {

      final body = {
        'email': email,
        'password': password,
      };

      // Make the POST request
      final response = await _apiService.post(endpoint, body: body);

      // Convert the response to AuthModel
      if (kDebugMode) {
        print('AUTH DATA SOURCE RESPONSE: ${response.data}');
      }

      return AuthModel.fromJson(response.data);

    } catch (error) {


      if (kDebugMode) {
        print('Data Source Error during login: $error');
      }
      rethrow;
    }
  }
}