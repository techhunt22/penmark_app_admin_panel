import 'dart:async';
import 'package:get/get.dart';
import '../../../../../../constants/color_constants.dart';
import '../../../../../../constants/snackbar_widget.dart';

import '../../../../../domain/entities/settings/papertype/update_papertype_entity.dart';
import '../../../../../domain/usecases/settings/papertype/update_papertype_usecase.dart';

import '../getpapertype/get_papertype_controller.dart';



class UpdatePaperTypeController extends GetxController{
  final UpdatePaperTypeUseCase _updatePaperTypeUseCase;
  final PaperTypeController _paperTypeController;

  UpdatePaperTypeController(this._updatePaperTypeUseCase, this._paperTypeController, );

  var updateType = Rxn<UpdatePaperTypeDataEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages
  final isLoadingMap = <String, RxBool>{}.obs;



  Future<void> updatePaperTypes({ required String id, String? type, String? price,})async {
    errorMessage.value = '';

    isLoadingMap[id] = true.obs;

    final result = await _updatePaperTypeUseCase.updatePaperTypeUseCase(
      id: id,
      price: price,
      type: type,

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

        updateType.value = success.data;
        _paperTypeController.fetchPaperTypes();

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