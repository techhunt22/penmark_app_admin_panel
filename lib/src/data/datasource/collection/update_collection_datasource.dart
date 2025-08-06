import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/collection/update_collection_model.dart';


// abstract class
abstract class UpdateCollectionDatasource {
  Future<UpdateCollectionModel> updateCollection(UpdateCollectionParams params ,String id);

}

class UpdateCollectionDataImpl implements UpdateCollectionDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<UpdateCollectionModel> updateCollection(UpdateCollectionParams params, String id ) async {
    String endpoint = ListAPI.updateCollection(id);




    try {
      final headers = ApiHeaders.getAuthHeaders();


      FormData formData = FormData();

      if (params.name != null) {
        formData.fields.add(MapEntry('name', params.name!));
      }
      if (params.status != null) {
        formData.fields.add(MapEntry('status', params.status!));
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
        print('UPDATE COLLECTION DATA SOURCE RESPONSE: ${response.data}\n\n');
      }

      return UpdateCollectionModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during UPDATE COLLECTION: $error\n\n');
      }
      rethrow;
    }
  }
}



class UpdateCollectionParams {
  final String? name;
  final String? status;
  final Uint8List? fileBytes;
  final String? fileName;

  UpdateCollectionParams({
    this.name,
    this.status,
    this.fileBytes,
    this.fileName,
  });
}
