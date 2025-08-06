import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/template/add_templates_model.dart';


// abstract class
abstract class AddTemplateDatasource {
  Future<AddTemplatesModel> templates(AddTemplateParams params);

}

class AddTemplatesDataImpl implements AddTemplateDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<AddTemplatesModel> templates(AddTemplateParams params) async {
    const String endpoint = ListAPI.addTemplate;




    try {
      final headers = ApiHeaders.getAuthHeaders();

      FormData formData = FormData.fromMap({
        'name': params.name,
        'status': params.status,
        'collectionId': params.collectionId,
        'file': MultipartFile.fromBytes(
          params.fileBytes,
          filename: params.fileName,
        ),
      });

      // Make the POST request
      final response = await apiService.post(
          endpoint, body: formData,
        headers: headers,
      );

      // Convert the response to AuthModel
      if (kDebugMode) {
        print('ADD TEMPLATES DATA SOURCE RESPONSE: ${response.data}');
      }

      return AddTemplatesModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during ADD TEMPLATES: $error');
      }
      rethrow;
    }
  }
}

class AddTemplateParams {
  final String name;
  final String status;
  final String collectionId;
  final Uint8List fileBytes;
  final String fileName;

  AddTemplateParams({
    required this.name,
    required this.status,
    required this.collectionId,
    required this.fileBytes,
    required this.fileName,
  });
}
