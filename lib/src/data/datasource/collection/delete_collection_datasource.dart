import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/collection/delete_collection_model.dart';


// abstract class
abstract class DeleteCollectionDatasource {
  Future<DeleteCollectionModel> deleteCollection({required String templateId});

}

class DeleteCollectionDataImpl implements DeleteCollectionDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<DeleteCollectionModel> deleteCollection({required String templateId}) async {
    String endpoint = ListAPI.deleteCollection(templateId);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.delete(
        endpoint,
        headers: headers,
      );


      return DeleteCollectionModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during DELETE COLLECTION: $error\n');
      }
      rethrow;
    }
  }


}

