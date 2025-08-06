
import 'dart:async';

import 'package:coloring_app_admin_panel/src/presentation/controllers/settings/papersize/getpapersize/papersize_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/settings/papersize/get_papersize_entity.dart';
import '../../../../../domain/usecases/settings/papersize/get_papersize_usecase.dart';



class PaperSizeController extends GetxController{
  final GetPaperSizeUseCase getPaperSizeUseCase;

  PaperSizeController(this.getPaperSizeUseCase, );

  var paperSize = <GetPaperSizeDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  List<PaperSizeFieldControllers> formControllers = [];



  @override
  void onInit() {
    super.onInit();
   fetchPaperSizes();
  }

  @override
  void onClose() {
    for (var f in formControllers) {
      f.dispose();
    }
    super.onClose();
  }

  Future<void> fetchPaperSizes()async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await getPaperSizeUseCase.getPaperSizeUseCase();

    result.fold(
          (failure) {

        errorMessage.value = failure.message;


      },
          (success) {
        errorMessage.value = '';

        paperSize.assignAll(success.data);


        formControllers = success.data.map((e) =>
            PaperSizeFieldControllers(size: e.size, price: e.price))
            .toList();

      },
    );


    isLoading.value = false;

  }

}