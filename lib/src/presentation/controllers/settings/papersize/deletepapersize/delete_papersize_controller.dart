import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../../constants/color_constants.dart';
import '../../../../../../constants/snackbar_widget.dart';
import '../../../../../domain/entities/settings/papersize/delete_papersize_entity.dart';
import '../../../../../domain/usecases/settings/papersize/delete_papersize_usecase.dart';
import '../getpapersize/get_papersize_controller.dart';




class DeletePaperSizeController extends GetxController{
  final DeletePaperSizeUseCase deletePaperSizeUseCase;
  final PaperSizeController paperSizeController;

  DeletePaperSizeController(this.deletePaperSizeUseCase, this.paperSizeController, );

  var delete = Rxn<DeletePaperSizeEntity>();
  final isLoadingMap = <String, RxBool>{}.obs;
  var errorMessage = ''.obs; // Store error messages



  Future<void> deletePaperSizes({required String id})async {
    errorMessage.value = '';

    isLoadingMap[id] = true.obs;

    final result = await deletePaperSizeUseCase.deletePaperSizeUseCase(id: id);

    await Future.delayed(Duration(seconds: 2));

    result.fold(
          (failure) {

        errorMessage.value = failure.message;
        showSnackbar(
            title: "Failed",
            message: errorMessage.value,
            backgroundColor: AppColors.red
        );

      },
          (success) {
        errorMessage.value = '';

        delete.value = success;
        if (kDebugMode) {
          print("Deleted paper size with ${delete.value?.message}");
        }

        paperSizeController.fetchPaperSizes();

        showSnackbar(
            title: "Deleted",
            message: success.message,
            backgroundColor: AppColors.primarycolor
        );

      },
    );


    // Remove loading state for the item
    isLoadingMap.remove(id);

    // Optional safeguard if list gets too big (not usually necessary unless you're doing thousands of deletes)
    if (isLoadingMap.length > 1000) {
      isLoadingMap.clear();
    }
  }

}