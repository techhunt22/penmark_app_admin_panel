import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/template/update_template_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/update_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/update_template_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/snackbar_widget.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../domain/entities/template/get_templates_entity.dart';
import '../../collection/getcollection/collections_controller.dart';
import '../addtemplate/add_template_controller.dart';
import '../addtemplate/filepicker_class.dart';

class UpdateTemplateController extends GetxController {
  final UpdateTemplateUseCase updateTemplateUseCase;
  final TemplatesFilePickerService filePickerService;
  final CollectionsController collectionsController;
  final TemplatesController templatesController;

  UpdateTemplateController(this.updateTemplateUseCase, this.filePickerService, this.collectionsController, this.templatesController,);

  RxBool isLoading = false.obs;
  var templates = Rxn<UpdateTemplateEntity>();
  var errorMessage = ''.obs;
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectedFileBytes = Rx<Uint8List?>(null);
  var selectedFileName = ''.obs;
  var selectedCollection = Rxn<String>();
  var isActive = false.obs;
  var fileError = ''.obs; // ✅ Track file selection errors
 // var collectionItems = <CollectionItem>[].obs;

  @override
  void onInit() {
    super.onInit();

    collectionsController.collectionList();
  }

  // Future<void> _initializeCollections() async {
  //   await collectionsController.fetchCollections();
  //   loadCollectionItems();
  // }
  //
  // void loadCollectionItems() {
  //   collectionItems.value = collectionsController.collections
  //       .map((e) => CollectionItem(id: e.id, name: e.name))
  //       .toList();
  //
  //   print("CollectionsController Collections: ${collectionsController.collections.length}");
  //   print("CollectionItems Loaded: ${collectionItems.length}");
  // }
  //

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



  late GetTemplatesDataEntity _originalTemplate;

  void loadTemplate(GetTemplatesDataEntity template) {
    _originalTemplate = template;

    nameController.text = template.name;
    isActive.value = template.status == "active";
    selectedFileName.value = template.svgImage;


  }

  Future<void> submit(Function onSuccess) async  {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    String? updatedName;
    if (nameController.text.trim() != _originalTemplate.name) {
      updatedName = nameController.text.trim();
      debugPrint("📝 Name changed to: $updatedName\n\n");
    }

    String? updatedStatus;
    final currentStatus = isActive.value ? 'active' : 'inactive';
    if (currentStatus != _originalTemplate.status) {
      updatedStatus = currentStatus;
      debugPrint("📶 Status changed to: $updatedStatus\n\n");
    }

    //TODO CHANGE THE COLLECTION FETCHING IN DROPDOWN
    String? updatedCollectionId;
    final selectedCollectionId = selectedCollection.value;
    final originalCollectionId = _originalTemplate.collectionname;

    debugPrint("Original Collection ID: $originalCollectionId");
    debugPrint("Selected Collection ID: $selectedCollectionId");

    if (selectedCollectionId != originalCollectionId) {
      updatedCollectionId = selectedCollectionId;
      debugPrint("📂 Collection changed to ID: $updatedCollectionId\n\n");
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
        updatedCollectionId == null &&
        updatedFileBytes == null) {
      isLoading.value = false;
      showSnackbar(
        title: 'No Changes',
        message: 'You haven’t updated anything.',
        backgroundColor: Colors.orange,
      );
      return;
    }

    final params = UpdateTemplateParams(
      name: updatedName,
      status: updatedStatus,
      collectionId: updatedCollectionId,
      fileBytes: updatedFileBytes,
      fileName: updatedFileName,
    );

    final result = await updateTemplateUseCase.updateTemplateUseCase(params, _originalTemplate.id);




    isLoading.value = false;

    result.fold(
          (failure) => ErrorHandler.handleError(failure.message),

          (success) {
        templates.value = success;
        templatesController.refreshData();

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



