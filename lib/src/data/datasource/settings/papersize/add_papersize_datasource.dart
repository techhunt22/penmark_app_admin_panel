import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papersize/add_papersize_model.dart';


// abstract class
abstract class AddPaperSizeDatasource {
  Future<AddPaperSizeModel> addPaperSize({required String size,required String price});

}

class AddPaperSizeDataImpl implements AddPaperSizeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<AddPaperSizeModel> addPaperSize({required String size,required String price}) async {
    const String endpoint = ListAPI.addPaperSize;


    try {
      final headers = ApiHeaders.getAuthHeaders();

      final body = {
        'size' : size,
        'price' : price
      };


      // Make the POST request
      final response = await apiService.post(
        endpoint,
        headers: headers,
        body: body
      );


      return AddPaperSizeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during ADD PAPER SIZE: $error\n');
      }
      rethrow;
    }
  }

}

