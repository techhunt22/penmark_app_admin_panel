import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';

import '../../../models/settings/papertype/delete_papertype_model.dart';


// abstract class
abstract class DeletePaperTypeDatasource {
  Future<DeletePaperTypeModel> deletePaperType({required String id});

}

class DeletePaperTypeDataImpl implements DeletePaperTypeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<DeletePaperTypeModel> deletePaperType({required String id}) async {
    String endpoint = ListAPI.deletePaperType(id);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.delete(
        endpoint,
        headers: headers,
      );


      return DeletePaperTypeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during DELETE PAPER TYPE: $error\n');
      }
      rethrow;
    }
  }


}

