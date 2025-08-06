import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


import '../../../../../../constants/color_constants.dart';
import '../../../../../../constants/snackbar_widget.dart';
import '../../../../../domain/entities/settings/papertype/delete_papertype_entity.dart';
import '../../../../../domain/usecases/settings/papertype/delete_papertype_usecase.dart';

import '../getpapertype/get_papertype_controller.dart';



class DeletePaperTypeController extends GetxController{
  final DeletePaperTypeUseCase deletePaperTypeUseCase;
  final PaperTypeController paperTypeController;

  DeletePaperTypeController(this.deletePaperTypeUseCase, this.paperTypeController, );

  var delete = Rxn<DeletePaperTypeEntity>();
  final isLoadingMap = <String, RxBool>{}.obs;
  var errorMessage = ''.obs; // Store error messages



  Future<void> deletePaperTypes({required String id})async {
    errorMessage.value = '';

    isLoadingMap[id] = true.obs;

    final result = await deletePaperTypeUseCase.deletePaperTypeUseCase(id: id);

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
          print("Deleted paper type with ${delete.value?.message}");
        }

        paperTypeController.fetchPaperTypes();

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