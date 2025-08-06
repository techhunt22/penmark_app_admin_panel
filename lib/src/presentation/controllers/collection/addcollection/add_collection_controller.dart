import 'dart:typed_data';

import 'package:coloring_app_admin_panel/src/data/datasource/collection/add_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/add_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/collection/add_collection_usecase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/snackbar_widget.dart';
import '../../../../core/error/error_handler.dart';
import '../getcollection/collections_controller.dart';
import 'collection_filepicker_class.dart';

class AddCollectionController extends GetxController {
  final AddCollectionUseCase addCollectionUseCase;
  final CollectionFilePickerClass filePickerService;
  final CollectionsController collectionsController;

  AddCollectionController(this.addCollectionUseCase, this.filePickerService, this.collectionsController,);

  RxBool isLoading = false.obs;
  var collection = Rxn<AddCollectionEntity>();
  var errorMessage = ''.obs;
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectedFileBytes = Rx<Uint8List?>(null);
  var selectedFileName = ''.obs;
  var isActive = false.obs;
  var fileError = ''.obs;





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


      isLoading.value = true;

      // Simulate API Call
      final submitResult = AddCollectionParams(
        name: nameController.text.trim(),
        status: status,
        fileBytes: selectedFileBytes.value!,
        fileName: selectedFileName.value,
      );
      if (kDebugMode) {
        print("Submitting collection: ${nameController.text},\n${selectedFileName.value}\n$status");
      }

      final result = await addCollectionUseCase.collectionUseCase(submitResult);

      isLoading.value = false;

      result.fold(
            (failure) {
          ErrorHandler.handleError(failure.message);
        },
            (success) {
          collection.value = success;
          showSnackbar(
            title: "Successful",
            message: success.message,
            backgroundColor: AppColors.primarycolor,
          );
          collectionsController.refreshData();

          resetFields();
          onSuccess(); // Callback only when API call is successful
        },
      );
    }
  }
}
