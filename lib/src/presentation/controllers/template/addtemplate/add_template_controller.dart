import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/add_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/add_template_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/snackbar_widget.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../data/datasource/template/add_template_datasource.dart';
import '../../collection/getcollection/collections_controller.dart';
import 'filepicker_class.dart';

class CollectionItem {
  final String id;
  final String name;

  CollectionItem({required this.id, required this.name});

  @override
  String toString() => name; // Good for debugging
}




class AddTemplateController extends GetxController {
  final AddTemplateUseCase addTemplateUseCase;
  final TemplatesFilePickerService filePickerService;
  final CollectionsController collectionsController;
  final TemplatesController templatesController;

  AddTemplateController(this.addTemplateUseCase, this.filePickerService, this.collectionsController, this.templatesController);

  RxBool isLoading = false.obs;
  var templates = Rxn<AddTemplatesEntity>();
  var errorMessage = ''.obs;
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectedFileBytes = Rx<Uint8List?>(null);
  var selectedFileName = ''.obs;
  var selectedCollection = Rxn<String>();
  var isActive = false.obs;
  var fileError = ''.obs;


  @override
  void onInit() {
    super.onInit();
    collectionsController.collectionList();

  }




  //select file
  void selectFile() async {
    try {
      FilePickerResult? result = await filePickerService.pickFile();

      if (result != null && result.files.isNotEmpty) {
        selectedFileName.value = result.files.single.name;
        selectedFileBytes.value =
            result.files.single.bytes; // Ensure it's never null
        fileError.value = ''; // ✅ Clear error when file is selected

        if (kDebugMode) {
          print("File selected: ${selectedFileName.value}");
        }
      } else {
        if (kDebugMode) {
          print("No file selected");
        }
        clearFile(); // ✅ Reset previous file selection
        fileError.value = 'Please select a file';
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error selecting file: $e");
      }
      ErrorHandler.handleError("Please select a file");

      fileError.value = 'Error selecting file';
    }
  }

  //clear file
  void clearFile() {
    selectedFileBytes.value = null;
    selectedFileName.value = '';
    fileError.value = ''; // ✅ Clear file error

    if (kDebugMode) {
      print("🗑 File cleared.");
    }
  }

  //reset fields
  void resetFields() {
    nameController.clear();
    selectedFileBytes.value = null;
    selectedFileName.value = '';
    selectedCollection.value = null;
    isActive.value = false;
    isLoading.value = false;
    fileError.value = '';
    if (kDebugMode) {
      print("🔄 Form fields reset.");
    }
  }

  Future<void> submit(Function onSuccess) async {
    String status = isActive.value ? "active" : "inactive";

    if (formKey.currentState!.validate()) {
      if (selectedFileBytes.value == null) {
        fileError.value = 'Please select a file'; // ✅ Show error message under file selection
        return;
      }

      if (selectedCollection.value == null) {
        ErrorHandler.handleError("Please select a collection");
        return;
      }

      isLoading.value = true;

      String updatedCollectionId;

      updatedCollectionId = selectedCollection.value!;

      // Simulate API Call
      final submitResult = AddTemplateParams(
        name: nameController.text.trim(),
        status: status,
        collectionId: updatedCollectionId,
        fileBytes: selectedFileBytes.value!,
        fileName: selectedFileName.value,
      );
      if (kDebugMode) {
        print("Submitting template: ${nameController.text},\n${selectedFileName.value}\n$status");
      }

      final result = await addTemplateUseCase.templateUseCase(submitResult);

      isLoading.value = false;

      result.fold(
        (failure) {
          ErrorHandler.handleError(failure.message);
        },
        (success) {
          templates.value = success;
          showSnackbar(
            title: "Successful",
            message: success.message,
            backgroundColor: AppColors.primarycolor,
          );
          templatesController.refreshData();

          resetFields();
          onSuccess(); // Callback only when API call is successful
        },
      );
    }
  }
}
