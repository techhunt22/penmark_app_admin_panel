
import 'dart:async';
import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/snackbar_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/settings/papersize/add_papersize_entity.dart';
import '../../../../../domain/usecases/settings/papersize/add_papersize_usecase.dart';
import '../getpapersize/get_papersize_controller.dart';



class AddPaperSizeController extends GetxController{
  final AddPaperSizeUseCase addPaperSizeUseCase;
  final PaperSizeController paperSizeController;

  AddPaperSizeController(this.addPaperSizeUseCase,this.paperSizeController, );

  var addSize = Rxn<AddPaperSizeDataEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages

  final TextEditingController addPrintSize = TextEditingController();
  final TextEditingController addPrintPrice = TextEditingController();

  @override
  void onClose() {
    addPrintSize.dispose;
    addPrintPrice.dispose;
    super.onClose();
  }

  Future<void> addPaperSizes({required String size,required String price})async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await addPaperSizeUseCase.addPaperSizeUseCase(size: size, price: price);

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

        addSize.value = success.data;
        addPrintSize.clear();
        addPrintPrice.clear();

        paperSizeController.fetchPaperSizes();
        showSnackbar(
            title: "Success",
            message: success.message,
            backgroundColor: AppColors.primarycolor
        );

      },
    );


    isLoading.value = false;

  }

}