
import 'dart:async';

import 'package:coloring_app_admin_panel/src/domain/entities/user/update_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/user/get_users_usecase.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/user/update_user_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/user/getuser/users_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../domain/entities/user/get_user_entity.dart';


class UpdateUserController extends GetxController{
  final UpdateUserUseCase  updateUserUseCase ;

  UpdateUserController(this.updateUserUseCase,);

  var updateUser = Rxn<UpdateUserEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages




  Future<void> fetchUpdateUser({required String status,required String userId,
   // required Function onSuccess
  })async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await updateUserUseCase.updateUserUseCase(
      userId: "67ffcd1609873aaa6d5b355c",
      status: "active",
    );


    result.fold(
          (failure) => ErrorHandler.handleError(failure.message),

      (success) {
        errorMessage.value = '';
        updateUser.value = success;
      //  onSuccess();
      },
    );

    isLoading.value = false;

  }


}