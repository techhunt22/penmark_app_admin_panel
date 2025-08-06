import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/collection/add_collection_model.dart';
import '../../models/template/add_templates_model.dart';


// abstract class
abstract class AddCollectionDatasource {
  Future<AddCollectionModel> collection(AddCollectionParams params);

}

class AddCollectionDataImpl implements AddCollectionDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<AddCollectionModel> collection(AddCollectionParams params) async {
    const String endpoint = ListAPI.addCollections;




    try {
      final headers = ApiHeaders.getAuthHeaders();

      FormData formData = FormData.fromMap({
        'name': params.name,
        'status': params.status,
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
        print('ADD COLLECTION DATA SOURCE RESPONSE: ${response.data}');
      }

      return AddCollectionModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during ADD COLLECTION: $error');
      }
      rethrow;
    }
  }
}

class AddCollectionParams {
  final String name;
  final String status;
  final Uint8List fileBytes;
  final String fileName;

  AddCollectionParams({
    required this.name,
    required this.status,
    required this.fileBytes,
    required this.fileName,
  });
}
