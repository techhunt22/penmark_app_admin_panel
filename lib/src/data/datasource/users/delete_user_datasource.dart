import 'package:coloring_app_admin_panel/src/data/models/template/delete_template_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/user/delete_user_model.dart';


// abstract class
abstract class DeleteUserDatasource {
  Future<DeleteUserModel> deleteUser({required String userId});

}

class DeleteUserDataImpl implements DeleteUserDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<DeleteUserModel> deleteUser({required String userId}) async {
     String endpoint = ListAPI.deleteUser(userId);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.delete(
        endpoint,
        headers: headers,
      );


      return DeleteUserModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during DELETE USER: $error\n');
      }
      rethrow;
    }
  }


}

