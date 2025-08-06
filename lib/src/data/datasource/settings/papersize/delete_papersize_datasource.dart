import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papersize/delete_papersize_model.dart';



// abstract class
abstract class DeletePaperSizeDatasource {
  Future<DeletePaperSizeModel> deletePaperSize({required String id});

}

class DeletePaperSizeDataImpl implements DeletePaperSizeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<DeletePaperSizeModel> deletePaperSize({required String id}) async {
    String endpoint = ListAPI.deletePaperSize(id);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.delete(
        endpoint,
        headers: headers,
      );


      return DeletePaperSizeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during DELETE PAPER SIZE: $error\n');
      }
      rethrow;
    }
  }


}

