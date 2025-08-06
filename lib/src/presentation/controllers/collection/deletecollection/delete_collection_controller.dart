import 'dart:async';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/delete_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/delete_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/collection/delete_collection_usecase.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/delete_template_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/getcollection/collections_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/snackbar_widget.dart';
import '../../../../core/error/error_handler.dart';

class DeleteCollectionController extends GetxController {
  final DeleteCollectionUseCase deleteCollectionUseCase;
  final CollectionsController collectionsController;

  DeleteCollectionController(this.deleteCollectionUseCase, this.collectionsController,);

  var delete = Rxn<DeleteCollectionEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages

  Future<void> deleteCollection({required String templateId, required Function onSuccess}) async {
    isLoading.value = true;

    final result = await deleteCollectionUseCase.deleteCollectionUseCase(templateId: templateId);

    result.fold(
          (failure) {
        errorMessage.value = failure.message;
        ErrorHandler.handleError(failure.message);

        delete.value = null;
      },
          (success) {
        delete.value = success;

        if (kDebugMode) {
          print('Success: ${success.success}, Message: ${success.message}');
        }

        if (collectionsController.collections.length == 1 && collectionsController.currentPage > 1) {
          collectionsController.currentPage--; // Move to previous page
        }

        collectionsController.refreshData();

        showSnackbar(
          title: "Success",
          message: success.message,
          backgroundColor: AppColors.primarycolor,
        );

        onSuccess();
      },
    );

    isLoading.value = false;
  }
}
