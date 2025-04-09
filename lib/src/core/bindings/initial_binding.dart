import 'package:coloring_app_admin_panel/src/core/service/service.dart';
import 'package:get/get.dart';
import '../../presentation/controllers/routes/navigation_controller.dart';
import '../jwt_token_decryption.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(ApiService());

    JwtHelper.validateToken();
  }
}