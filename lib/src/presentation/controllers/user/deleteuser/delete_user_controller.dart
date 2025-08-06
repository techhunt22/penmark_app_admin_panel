import 'dart:async';
import 'package:coloring_app_admin_panel/src/domain/usecases/user/delete_user_usecase.dart';
import 'package:get/get.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../domain/entities/user/delete_user_entity.dart';


class DeleteUserController extends GetxController{
  final DeleteUserUseCase  _deleteUserUseCase;

  DeleteUserController(this._deleteUserUseCase,);

  var delete = Rxn<DeleteUserEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages




  Future<void> deleteUser({required String userId,required Function onSuccess })async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await _deleteUserUseCase.deleteUsersUseCase(
      userId: "67ffcd1609873aaa6d5b355c",
    );


    result.fold(
          (failure) => ErrorHandler.handleError(failure.message),

          (success) {
        errorMessage.value = '';
        delete.value = success;


        onSuccess();
      },
    );

    isLoading.value = false;

  }


}