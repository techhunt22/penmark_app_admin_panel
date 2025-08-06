import 'package:coloring_app_admin_panel/src/data/models/settings/charges/get_charges_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../core/apis/api_headers.dart';
import '../../../../core/apis/api_url.dart';
import '../../../../core/service/service.dart';



// abstract class
abstract class GetChargesDatasource {
  Future<GetChargesModel> getCharges();

}

class GetChargesDataImpl implements GetChargesDatasource {
  final apiService = Get.find<ApiService>();

  @override
  Future<GetChargesModel> getCharges() async {
    const String endpoint = ListAPI.getCharges;


    try {
      final headers = ApiHeaders.getAuthHeaders();

      // Make the POST request
      final response = await apiService.get(
        endpoint,
        headers: headers,
      );


      return GetChargesModel.fromJson(response.data);

    } catch (error) {

      if (kDebugMode) {
        print('Data Source Error during GET CHARGES: $error\n');
      }
      rethrow;
    }
  }

}

