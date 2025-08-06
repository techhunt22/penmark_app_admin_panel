import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/collection/update_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/template/update_template_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/update_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/update_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/collection/update_collection_usecase.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/update_template_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/snackbar_widget.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../domain/entities/collection/get_collection_entities.dart';
import '../../../../domain/entities/template/get_templates_entity.dart';
import '../../collection/getcollection/collections_controller.dart';
import '../addcollection/collection_filepicker_class.dart';

class UpdateCollectionController extends GetxController {
  final UpdateCollectionUseCase updateCollectionUseCase;
  final CollectionFilePickerClass filePickerService;
  final CollectionsController collectionsController;

  UpdateCollectionController(
    this.updateCollectionUseCase,
    this.filePickerService,
    this.collectionsController,
  );

  RxBool isLoading = false.obs;
  var templates = Rxn<UpdateCollectionEntity>();
  var errorMessage = ''.obs;
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectedFileBytes = Rx<Uint8List?>(null);
  var selectedFileName = ''.obs;
  var isActive = false.obs;
  var fileError = ''.obs;

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

  late GetCollectionDataEntity _originalCollection;

  void loadCollection(GetCollectionDataEntity collection) {
    _originalCollection = collection;

    nameController.text = collection.name;
    isActive.value = collection.status == "active";
    //selectedFileName.value = collection.svgImage;
  }

  Future<void> submit(Function onSuccess) async {
    errorMessage.value = '';

    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    String? updatedName;
    if (nameController.text.trim() != _originalCollection.name) {
      updatedName = nameController.text.trim();
      debugPrint("📝 Name changed to: $updatedName\n\n");
    }

    String? updatedStatus;
    final currentStatus = isActive.value ? 'active' : 'inactive';
    if (currentStatus != _originalCollection.status) {
      updatedStatus = currentStatus;
      debugPrint("📶 Status changed to: $updatedStatus\n\n");
    }

    Uint8List? updatedFileBytes;
    String? updatedFileName;
    if (selectedFileBytes.value != null) {
      updatedFileBytes = selectedFileBytes.value;
      updatedFileName = selectedFileName.value;
      debugPrint("📄 File updated to: $updatedFileName\n\n");
    }

    // Check if anything actually changed
    if (updatedName == null &&
        updatedStatus == null &&
        updatedFileBytes == null) {
      isLoading.value = false;
      showSnackbar(
        title: 'No Changes',
        message: 'You haven’t updated anything.',
        backgroundColor: Colors.orange,
      );
      return;
    }

    final params = UpdateCollectionParams(
      name: updatedName,
      status: updatedStatus,
      fileBytes: updatedFileBytes,
      fileName: updatedFileName,
    );

    final result = await updateCollectionUseCase.updateCollectionUseCase(
        params, _originalCollection.id);

    isLoading.value = false;

    result.fold(
      (failure) => ErrorHandler.handleError(failure.message),
      (success) {
        errorMessage.value = '';
        templates.value = success;
        collectionsController.refreshData();

        showSnackbar(
          title: "Success",
          message: success.message,
          backgroundColor: AppColors.primarycolor,
        );
        resetFields();
        onSuccess();
      },
    );
  }
}
