import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../constants/snackbar_widget.dart';
import '../../../core/session_storage.dart';
import '../../../domain/entities/auth/auth_entity.dart';
import '../../../domain/usecases/auth/auth_usecase.dart';

class AuthController extends GetxController {
  final AuthUseCase authUseCase;
  var isLoading = false.obs;
  var authEntity = Rx<AuthEntity?>(null);
  var errorMessage = ''.obs;
  var sessionManager = SessionManager.instance;

  AuthController(this.authUseCase);

  Future<void> login(String email, String password) async {
    isLoading.value = true;  // Set loading state to true
    try {
      // Call the login use case
      final authEntityData = await authUseCase.loginCall(email, password);
      
      sessionManager.saveSession('access_token', authEntityData.data.accessToken);

      if (kDebugMode) {
        print("AUTH CONTROLLER: ${authEntityData.data.accessToken}");
        print("ACCESS TOKEN : ${sessionManager.getSession("access_token")}");
      }

      showSnackbar(
        title: "Successful",
        message: authEntityData.message,
        backgroundColor: AppColors.primarycolor,
      );

     await Get.offAllNamed('/dashboard');


      // On success, update the authEntity
      authEntity.value = authEntityData;


    } catch (e) {
      // Handle errors here (for instance, if login fails)

      errorMessage.value = '$e';
      showSnackbar(
        title: "Failed",
        message: errorMessage.value,
        backgroundColor: AppColors.red,
      );



      if (kDebugMode) {
        print("AUTH CONTROLLER ERROR: $e");
      }
    } finally {
      // Set loading state to false after the call finishes
      isLoading.value = false;
    }
  }
}