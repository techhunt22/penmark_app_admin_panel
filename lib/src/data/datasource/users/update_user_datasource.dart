import 'package:coloring_app_admin_panel/src/data/models/user/update_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/user/get_user_model.dart';


// abstract class
abstract class UpdateUserDatasource {
  Future<UpdateUserModel> updateUsers({required String userId, required String status });

}

class UpdateUserDataImpl implements UpdateUserDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<UpdateUserModel> updateUsers({required String userId, required String status }) async {
    String endpoint = ListAPI.updateUser(userId);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      final body = {
        'status': status,
      };

      // Make the POST request
      final response = await apiService.put(
        endpoint,
        headers: headers,
        body: body
      );


      return UpdateUserModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during UPDATE USER: $error');
      }
      rethrow;
    }
  }


}

