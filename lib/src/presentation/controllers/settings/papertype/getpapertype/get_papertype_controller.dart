import 'dart:async';
import 'package:coloring_app_admin_panel/src/presentation/controllers/settings/papertype/getpapertype/papertype_controllers.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/settings/papertype/get_papertype_entity.dart';
import '../../../../../domain/usecases/settings/papertype/get_papertype_usecase.dart';




class PaperTypeController extends GetxController{
  final GetPaperTypeUseCase getPaperTypeUseCase;

  PaperTypeController(this.getPaperTypeUseCase, );

  var paperType = <GetPaperTypeDataEntity>[].obs;
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  List<PaperTypeFieldControllers> formControllers = [];



  @override
  void onInit() {
    super.onInit();
    fetchPaperTypes();
  }

  @override
  void onClose() {
    for (var f in formControllers) {
      f.dispose();
    }
    super.onClose();
  }

  Future<void> fetchPaperTypes()async {
    errorMessage.value = '';

    isLoading.value = true;

    final result = await getPaperTypeUseCase.getPaperTypeUseCase();

    result.fold(
          (failure) {

        errorMessage.value = failure.message;


      },
          (success) {
        errorMessage.value = '';

        paperType.assignAll(success.data);


        formControllers = success.data.map((e) =>
            PaperTypeFieldControllers(type: e.type, price: e.price))
            .toList();

      },
    );


    isLoading.value = false;

  }

}