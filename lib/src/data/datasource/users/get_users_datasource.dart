import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/user/get_user_model.dart';


// abstract class
abstract class GetUsersDatasource {
  Future<GetUsersModel> users({required int page, required int limit});

}

class GetUsersDataImpl implements GetUsersDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<GetUsersModel> users({required int page, required int limit}) async {
    const String endpoint = ListAPI.getUsers;


    try {
      final headers = ApiHeaders.getAuthHeaders();

      final queryParams = {
        'page': page.toString(),
        'limit': limit.toString(),
      };

      // Make the POST request
      final response = await apiService.get(
        endpoint,
        queryParams: queryParams ,
        headers: headers,
      );


      return GetUsersModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during GET USERS: $error');
      }
      rethrow;
    }
  }


}

