import 'package:coloring_app_admin_panel/src/core/bindings/collections/update_collection_binding.dart';

import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/updatecollection/update_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';
import '../../../../domain/entities/collection/get_collection_entities.dart';

Future<void> showUpdateCollectionDialog(BuildContext context, GetCollectionDataEntity collection) async {

  UpdateCollectionBindings().dependencies();

  final controller = Get.find<UpdateCollectionController>();


  controller.loadCollection(collection);

  Get.defaultDialog(
      title: "Update Collection",
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
                  'Collection Name',
                  style: TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                  ),
                ),

                const SizedBox(height: 8),
                textFieldWidget(controller),

                const SizedBox(height: gap),

                // Upload File
                const Text(
                  'Upload Collection File',
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

                // Status Switch
                statusSwitchWidget(controller),

                const SizedBox(height: gap2),

                // Action Buttons
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ))
                    : actionButtonsWidget(controller, collection)),
              ],
            ),
          ),
        );
      }));
}

Widget textFieldWidget(UpdateCollectionController controller) {
  return TextFormField(
    controller: controller.nameController,
    decoration: InputDecoration(
      hintText: 'Collection name',
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
        return 'Please enter Collection name';
      }
      return null;
    },
  );
}

Widget uploadFileWidget(UpdateCollectionController controller) {
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
          const Icon(
            Icons.upload_file,
            color: AppColors.gray,
          ),
        ],
      ),
    ),
  );
}

Widget statusSwitchWidget(UpdateCollectionController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Collection Status',
        style: TextStyle(
          fontSize: AppFontSize.bodymedium,
          fontWeight: AppFonts.regular,
        ),
      ),
      Text(controller.isActive.value ? "Active" : "Inactive"),
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

Widget actionButtonsWidget(UpdateCollectionController controller, GetCollectionDataEntity collection) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            if (Get.isDialogOpen ?? false) {
              Get.close(1); // Closes the dialog only
            }
            controller.resetFields();
            Get.delete<UpdateCollectionController>();
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
            controller.submit(
              () async {
                if (Get.isDialogOpen ?? false) {
                  Get.close(1); // Closes the dialog only
                }

                Get.delete<UpdateCollectionController>();
              },
            );
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
