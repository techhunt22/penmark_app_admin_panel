
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/color_constants.dart';
import '../../../../../../constants/snackbar_widget.dart';
import '../../../../../domain/entities/settings/papersize/update_papersize_entity.dart';
import '../../../../../domain/usecases/settings/papersize/update_papersize_usecase.dart';
import '../getpapersize/get_papersize_controller.dart';



class UpdatePaperSizeController extends GetxController{
  final UpdatePaperSizeUseCase _updatePaperSizeUseCase;
  final PaperSizeController paperSizeController;

  UpdatePaperSizeController(this._updatePaperSizeUseCase, this.paperSizeController, );

  var updatePaperSize = Rxn<UpdatePaperSizeDataEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  final isLoadingMap = <String, RxBool>{}.obs;



  Future<void> updatePaperSizes({ required String id, String? size, String? price,})async {
    errorMessage.value = '';

    isLoadingMap[id] = true.obs;

    final result = await _updatePaperSizeUseCase.updatePaperSizeUseCase(
        id: id,
        price: price,
        size: size,

    );
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

        updatePaperSize.value = success.data;
        paperSizeController.fetchPaperSizes();

        showSnackbar(
            title: "Updated",
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