import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papersize/get_papersize_model.dart';



// abstract class
abstract class GetPaperSizeDatasource {
  Future<GetPaperSizeModel> paperSize();

}

class GetPaperSizeDataImpl implements GetPaperSizeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<GetPaperSizeModel> paperSize() async {
    const String endpoint = ListAPI.getPaperSize;


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.get(
        endpoint,
        headers: headers,
      );


      return GetPaperSizeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during GET PAPERSIZW: $error\n');
      }
      rethrow;
    }
  }

}

