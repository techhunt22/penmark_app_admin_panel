import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../core/apis/api_headers.dart';
import '../../../core/apis/api_url.dart';
import '../../../core/service/service.dart';
import '../../models/orders/get_orders_model.dart';


// abstract class
abstract class GetOrdersDatasource {
  Future<GetOrdersModel> orders({required int page, required int limit});

}

class GetOrdersDataImpl implements GetOrdersDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<GetOrdersModel> orders({required int page, required int limit}) async {
    const String endpoint = ListAPI.getorders;


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


      return GetOrdersModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during GET ORDERS: $error');
      }
      rethrow;
    }
  }


}

