import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';
import '../../../models/settings/papertype/update_papertype_model.dart';


// abstract class
abstract class UpdatePaperTypeDatasource {
  Future<UpdatePaperTypeModel> updatePaperType({required String id,  String? type, String? price});

}

class UpdatePaperTypeDataImpl implements UpdatePaperTypeDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<UpdatePaperTypeModel> updatePaperType({required String id, String? type, String? price}) async {
     String endpoint = ListAPI.updateType(id);


    try {
      final headers = ApiHeaders.getAuthHeaders();

      final Map<String, dynamic> body = {};
      if (type != null && type.isNotEmpty) body['type'] = type;
      if (price != null && price.isNotEmpty) body['price'] = price;


      // Make the POST request
      final response = await apiService.put(
          endpoint,
          headers: headers,
          body: body
      );


      return UpdatePaperTypeModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during UPDATE PAPER TYPE: $error\n');
      }
      rethrow;
    }
  }

}

