import 'package:coloring_app_admin_panel/src/data/models/template/delete_template_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';


// abstract class
abstract class DeleteTemplateDatasource {
  Future<DeleteTemplateModel> deleteTemplate({required String templateId});

}

class DeleteTemplateDataImpl implements DeleteTemplateDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<DeleteTemplateModel> deleteTemplate({required String templateId}) async {
    String endpoint = ListAPI.deleteTemplate(templateId);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.delete(
        endpoint,
        headers: headers,
      );


      return DeleteTemplateModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during DELETE TEMPLATE: $error\n');
      }
      rethrow;
    }
  }


}

