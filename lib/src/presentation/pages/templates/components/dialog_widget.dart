import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';
import '../../../../data/datasource/template/add_template_datasource.dart';
import '../../../../data/repositories_impl/template/add_template_repo_impl.dart';
import '../../../../domain/usecases/template/add_template_usecase.dart';
import '../../../controllers/template/addtemplate/add_template_controller.dart';
import '../../../controllers/template/addtemplate/filepicker_class.dart';

Future<void> showAddTemplateDialog(BuildContext context) async {
  final AddTemplateController controller = Get.put<AddTemplateController>(
    AddTemplateController(
      AddTemplateUseCase(AddTemplateRepositoryImpl(AddTemplatesDataImpl())),
      FilePickerServiceImpl(),
    ),
  );


  Get.defaultDialog(
      title: "Add Template",
      barrierDismissible: false,
      radius: 8,
      content: Obx(() {
        return Container(
          width: 400,
          padding: const EdgeInsets.all(24),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Template Name Field
                const Text(
                  'Template Name',
                  style: TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                  ),
                ),

                const SizedBox(height: 8),
                textfieldWidget(controller),

                const SizedBox(height: gap),

                // Upload File
                const Text(
                  'Upload Template File',
                  style: TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                  ),
                ),
                const SizedBox(height: 8),
                uploadFileWidget(controller),

                Obx(() => controller.fileError.value.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4, left: 10),
                        child: Text(
                          controller.fileError.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : const SizedBox.shrink()),

                const SizedBox(height: gap),

                // Collection Dropdown
                const Text(
                  'Assign To Collection',
                  style: TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                  ),
                ),
                const SizedBox(height: 8),

                dropdownButtonWidget(controller),

                const SizedBox(height: gap),

                // Status Switch
                statusSwtichWidget(controller),

                const SizedBox(height: gap2),

                // Action Buttons
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ))
                    : actionButtonsWidget(controller)),
              ],
            ),
          ),
        );
      }));
}

Widget textfieldWidget(AddTemplateController controller) {
  return TextFormField(
    controller: controller.nameController,
    decoration: InputDecoration(
      hintText: 'Template name',
      hintStyle: const TextStyle(
        fontSize: AppFontSize.bodymedium,
        fontWeight: AppFonts.regular,
      ),
      filled: true,
      fillColor: AppColors.gray.withValues(alpha: 0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter template name';
      }
      return null;
    },
  );
}

Widget uploadFileWidget(AddTemplateController controller) {
  return InkWell(
    onTap: () => controller.selectFile(),
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(() => Text(
                  controller.selectedFileName.value.isNotEmpty
                      ? controller.selectedFileName.value
                      : "No file selected",
                  style: TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                  ),
                )),
          ),
          const Icon(Icons.upload_file,color: AppColors.gray, ),
        ],
      ),
    ),
  );
}

Widget dropdownButtonWidget(AddTemplateController controller) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      hintText: 'Select Collection',
      filled: true,
      fillColor: AppColors.gray.withValues(alpha: 0.1),
      hintStyle: const TextStyle(
        fontSize: AppFontSize.bodymedium,
        fontWeight: AppFonts.regular,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    value: controller.selectedCollection.value,
    items: controller.collections.map((collection) {
      return DropdownMenuItem<String>(
        value: collection,
        child: Text(collection),
      );
    }).toList(),
    onChanged: (value) => controller.selectedCollection.value = value,
    validator: (value) {
      if (value == null) {
        return 'Please select a collection';
      }
      return null;
    },
  );
}

Widget actionButtonsWidget(AddTemplateController controller) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            if (Get.isDialogOpen ?? false) {
              Get.close(1); // Closes the dialog only
            }
            controller.resetFields();
            Get.delete<AddTemplateController>();
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            side: const BorderSide(color: AppColors.brightblue),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.brightblue),
          ),
        ),
      ),
      const SizedBox(width: gap),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            controller.submit(() async {
              if (Get.isDialogOpen ?? false) {
                Get.close(1); // Closes the dialog only
              }
              Get.delete<AddTemplateController>();
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: AppColors.brightblue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      )
    ],
  );
}

Widget statusSwtichWidget(AddTemplateController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Template Status',
        style: TextStyle(
          fontSize: AppFontSize.bodymedium,
          fontWeight: AppFonts.regular,
        ),
      ),
      Text(controller.isActive.value ? "Active" : "Disabled"),
      Obx(
        () => Switch(
          value: controller.isActive.value,
          onChanged: (value) => controller.isActive.value = value,
          activeColor: AppColors.brightblue,
        ),
      )
    ],
  );
}
