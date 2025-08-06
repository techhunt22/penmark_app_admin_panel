import 'dart:async';
import 'package:coloring_app_admin_panel/src/domain/entities/template/delete_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/delete_template_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/snackbar_widget.dart';
import '../../../../core/error/error_handler.dart';
import '../gettemplates/get_templates_controller.dart';

class DeleteTemplateController extends GetxController {
  final DeleteTemplateUseCase deleteTemplateUseCase;
  final TemplatesController templatesController;

  DeleteTemplateController(this.deleteTemplateUseCase, this.templatesController,);

  var delete = Rxn<DeleteTemplateEntity>();
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Store error messages

  Future<void> deleteTemplate({required String templateId, required Function onSuccess}) async {
    isLoading.value = true;

    final result = await deleteTemplateUseCase.deleteTemplateUseCase(templateId: templateId);

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

        if (templatesController.templates.length == 1 && templatesController.currentPage > 1) {
          templatesController.currentPage--; // Move to previous page
        }

        templatesController.refreshData();

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
