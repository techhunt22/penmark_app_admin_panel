import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papertype/get_papertype_model.dart';



// abstract class
abstract class GetPaperTypeDatasource {
  Future<GetPaperTypeModel> paperType();

}

class GetPaperTypeDataImpl implements GetPaperTypeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<GetPaperTypeModel> paperType() async {
    const String endpoint = ListAPI.getPaperType;


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.get(
        endpoint,
        headers: headers,
      );


      return GetPaperTypeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during GET PAPER TYPE: $error\n');
      }
      rethrow;
    }
  }

}

