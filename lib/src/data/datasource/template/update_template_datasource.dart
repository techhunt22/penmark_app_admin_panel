import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/template/update_template_model.dart';


// abstract class
abstract class UpdateTemplateDatasource {
  Future<UpdateTemplateModel> updateTemplates(UpdateTemplateParams params ,String id);

}

class UpdateTemplatesDataImpl implements UpdateTemplateDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<UpdateTemplateModel> updateTemplates(UpdateTemplateParams params, String id ) async {
     String endpoint = ListAPI.updateTemplate(id);




    try {
      final headers = ApiHeaders.getAuthHeaders();

      // FormData formData = FormData.fromMap({
      //   'name': params.name,
      //   'status': params.status,
      //   'collectionId': params.collectionId,
      //   'file': MultipartFile.fromBytes(
      //     params.fileBytes,
      //     filename: params.fileName,
      //   ),
      // });


      FormData formData = FormData();

      if (params.name != null) {
        formData.fields.add(MapEntry('name', params.name!));
      }
      if (params.status != null) {
        formData.fields.add(MapEntry('status', params.status!));
      }
      if (params.collectionId != null) {
        formData.fields.add(MapEntry('collectionId', params.collectionId!));
      }
      if (params.fileBytes != null && params.fileName != null) {
        formData.files.add(MapEntry(
          'file',
          MultipartFile.fromBytes(params.fileBytes!, filename: params.fileName!),
        ));
      }


      // Make the POST request
      final response = await apiService.put(
        endpoint,
        body: formData,
        headers: headers,
      );

      // Convert the response to AuthModel
      if (kDebugMode) {
        print('UPDATE TEMPLATES DATA SOURCE RESPONSE: ${response.data}\n\n');
      }

      return UpdateTemplateModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during UPDATE TEMPLATES: $error\n\n');
      }
      rethrow;
    }
  }
}



class UpdateTemplateParams {
  final String? name;
  final String? status;
  final String? collectionId;
  final Uint8List? fileBytes;
  final String? fileName;

  UpdateTemplateParams({
    this.name,
    this.status,
    this.collectionId,
    this.fileBytes,
    this.fileName,
  });
}
