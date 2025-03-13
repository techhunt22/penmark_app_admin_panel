import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/dashboard/add_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/dashboard/add_template_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../constants/snackbar_widget.dart';
import '../../../data/datasource/dashboard/add_template_datasource.dart';


class AddTemplateController extends GetxController {
  final AddTemplateUseCase addTemplateUseCase;
  RxBool  isLoading = false.obs;
  var templates = Rxn<AddTemplatesEntity>();
  var errorMessage = ''.obs;



  AddTemplateController(this.addTemplateUseCase);

  Future<void> addTemplates(AddTemplateParams params) async {
    isLoading.value = true;  // Set loading state to true
    try {
      // Call the login use case
      final addTemplates = await addTemplateUseCase.templateUseCase( params);

      templates.value = addTemplates;


      if (kDebugMode) {
        print("ADD TEMPLATES CONTROLLER:\n${addTemplates.data.id}");
        print("Name: ${addTemplates.data.name}");
        print("Status: ${addTemplates.data.status}");
        print("Image Name: ${addTemplates.data.svgImage}");
        print("Collection Name: ${addTemplates.data.collectionname}");

      }

      showSnackbar(
        title: "Successful",
        message: addTemplates.message,
        backgroundColor: AppColors.primarycolor,
      );



    } catch (e) {

      errorMessage.value = '$e';
      showSnackbar(
        title: "Failed",
        message: errorMessage.value,
        backgroundColor: AppColors.red,
      );


      if (kDebugMode) {
        print("ADD TEMPLATES CONTROLLER ERROR: $e");
      }

    } finally {
      // Set loading state to false after the call finishes
      isLoading.value = false;
    }
  }








}