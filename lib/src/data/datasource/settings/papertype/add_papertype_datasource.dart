import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papertype/add_papertype_model.dart';



// abstract class
abstract class AddPaperTypeDatasource {
  Future<AddPaperTypeModel> addPaperType({required String type,required String price});

}

class AddPaperTypeDataImpl implements AddPaperTypeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<AddPaperTypeModel> addPaperType({required String type,required String price}) async {
    const String endpoint = ListAPI.addPaperType;


    try {
      final headers = ApiHeaders.getAuthHeaders();

      final body = {
        'type' : type,
        'price' : price
      };


      // Make the POST request
      final response = await apiService.post(
        endpoint,
        headers: headers,
        body: body
      );


      return AddPaperTypeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during ADD PAPER TYPE: $error\n');
      }
      rethrow;
    }
  }

}

