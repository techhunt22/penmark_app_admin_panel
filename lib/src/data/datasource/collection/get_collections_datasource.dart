import 'package:coloring_app_admin_panel/src/data/models/collection/get_collections_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';


// abstract class
abstract class GetCollectionsDatasource {
  Future<GetCollectionsModel> collections({required int page, required int limit});

}

class GetCollectionDataImpl implements GetCollectionsDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<GetCollectionsModel> collections({required int page, required int limit}) async {
    const String endpoint = ListAPI.getcollections;


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


      return GetCollectionsModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during GET COLLECTIONS: $error');
      }
      rethrow;
    }
  }


}

