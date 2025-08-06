import 'dart:async';
import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/settings/papertype/add_papertype_entity.dart';
import '../../../../../domain/usecases/settings/papertype/add_papertype_usecase.dart';
import '../getpapertype/get_papertype_controller.dart';



class AddPaperTypeController extends GetxController{
  final AddPaperTypeUseCase addPaperTypeUseCase;
  final PaperTypeController paperTypeController;

  AddPaperTypeController(this.addPaperTypeUseCase,this.paperTypeController, );

  var addType = Rxn<AddPaperTypeDataEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages

  final TextEditingController addPrintType = TextEditingController();
  final TextEditingController addPrintPrice = TextEditingController();

  @override
  void onClose() {
    addPrintType.dispose;
    addPrintPrice.dispose;
    super.onClose();
  }

  Future<void> addPaperType({required String type,required String price})async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await addPaperTypeUseCase.addPaperTypeUseCase(type: type, price: price);

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

        addType.value = success.data;
        addPrintType.clear();
        addPrintPrice.clear();

        paperTypeController.fetchPaperTypes();
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