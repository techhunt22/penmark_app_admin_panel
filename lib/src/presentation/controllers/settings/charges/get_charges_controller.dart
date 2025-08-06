
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/settings/charges/get_charges_entity.dart';
import '../../../../domain/usecases/settings/charges/get_charges_usecase.dart';
import 'charges_textcontrollers.dart';




class GetChargesController extends GetxController{
  final GetChargesUseCase getChargesUseCase;

  GetChargesController(this.getChargesUseCase, );

  var charges = <GetChargesDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  List<GetChargesFieldControllers> formControllers = [];



  @override
  void onInit() {
    super.onInit();
    fetchCharges();
  }

  @override
  void onClose() {
    for (var f in formControllers) {
      f.dispose();
    }
    super.onClose();
  }

  Future<void> fetchCharges()async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await getChargesUseCase.getChargesUseCase();

    result.fold(
          (failure) {

        errorMessage.value = failure.message;


      },
          (success) {
        errorMessage.value = '';

        charges.assignAll(success.data);


        formControllers = success.data.map((e) =>
            GetChargesFieldControllers(tax: e.tax, delivery: e.deliveryCharges))
            .toList();

      },
    );


    isLoading.value = false;

  }

}