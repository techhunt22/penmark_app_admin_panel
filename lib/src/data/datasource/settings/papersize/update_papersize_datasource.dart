
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papersize/update_paperszie_model.dart';


// abstract class
abstract class UpdatePaperSizeDatasource {
  Future<UpdatePaperSizeModel> updatePaperSize({required String id,  String? size, String? price});

}

class UpdatePaperSizeDataImpl implements UpdatePaperSizeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<UpdatePaperSizeModel> updatePaperSize({required String id, String? size, String? price}) async {
     String endpoint = ListAPI.updateSize(id);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      final Map<String, dynamic> body = {};
      if (size != null && size.isNotEmpty) body['size'] = size;
      if (price != null && price.isNotEmpty) body['price'] = price;


      // Make the POST request
      final response = await apiService.put(
          endpoint,
          headers: headers,
          body: body
      );


      return UpdatePaperSizeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during UPDATE PAPER SIZE: $error\n');
      }
      rethrow;
    }
  }

}

