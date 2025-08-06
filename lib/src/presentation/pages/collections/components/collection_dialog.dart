import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:coloring_app_admin_panel/src/core/bindings/collections/add_collection_binding.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/collection/add_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/collection/get_collections_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/collection/add_collection_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/collection/get_collection_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/add_collection_repo.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/collection/add_collection_usecase.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/collection/get_collections_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/addcollection/add_collection_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/addcollection/collection_filepicker_class.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/getcollection/collections_cache_class.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/getcollection/collections_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';


// class CollectionDialog extends StatefulWidget {
//   final String title;
//   const CollectionDialog({super.key, required this.title});
//
//   @override
//   State<CollectionDialog> createState() => _CollectionDialogState();
// }
//
// class _CollectionDialogState extends State<CollectionDialog> {
//   bool isActive = false;
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         width: 400,
//         padding: const EdgeInsets.all(24),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.title,
//                 style: const TextStyle(
//                   fontSize: AppFontSize.headlinelarge,
//                   fontWeight: AppFonts.medium,
//                 ),
//               ),
//               const SizedBox(height: gap2),
//
//               // Template Name Field
//               const Text(
//                 'Collection Name',
//                 style: TextStyle(
//                   fontSize: AppFontSize.bodymedium,
//                   fontWeight: AppFonts.regular,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Collection Name',
//                   hintStyle: const TextStyle(
//                     fontSize: AppFontSize.bodysmall,
//                     fontWeight: AppFonts.regular,
//                   ),
//                   filled: true,
//                   fillColor: AppColors.gray.withValues(alpha:0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter template name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: gap),
//
//               // Upload Template File
//               const Text(
//                 'Collection Cover Image',
//                 style: TextStyle(
//                   fontSize: AppFontSize.bodymedium,
//                   fontWeight: AppFonts.regular,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               InkWell(
//                 onTap: () {
//                   // Add file picker logic here
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: AppColors.gray.withValues(alpha:0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: const Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'Upload Template File',
//                           style: TextStyle(
//                             color: AppColors.gray,
//                             fontSize: AppFontSize.bodysmall,
//                             fontWeight: AppFonts.regular,
//                           ),
//                         ),
//                       ),
//                       Icon(
//                         Icons.upload_file,
//                         color: AppColors.gray,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // Assign To Collection
//
//               const SizedBox(height: gap),
//
//               // Template Status
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Template Status',
//                     style: TextStyle(
//                       fontSize: AppFontSize.bodymedium,
//                       fontWeight: AppFonts.regular,
//                     ),
//                   ),
//                   Switch(
//                     value: isActive,
//                     onChanged: (value) {
//                       setState(() {
//                         isActive = value;
//                       });
//                     },
//                     activeColor: AppColors.brightblue,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: gap2),
//
//               // Action Buttons
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         side: const BorderSide(color: AppColors.brightblue),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(color: AppColors.brightblue),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: gap),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Handle save logic here
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         backgroundColor: AppColors.brightblue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         'Save',
//                         style: TextStyle(color: AppColors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



Future<void> showAddCollectionDialog(BuildContext context) async {

  AddCollectionBinding().dependencies(); // Instantiates everything
  final controller = Get.find<AddCollectionController>();

  Get.defaultDialog(
      title: "Add Collection",
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
                    : actionButtonsWidget(controller)),
              ],
            ),
          ),
        );
      }));
}

Widget textFieldWidget(AddCollectionController controller) {
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
        return 'Please enter template name';
      }
      return null;
    },
  );
}

Widget uploadFileWidget(AddCollectionController controller) {
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

Widget actionButtonsWidget(AddCollectionController controller) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            if (Get.isDialogOpen ?? false) {
              Get.close(1); // Closes the dialog only
            }
            controller.resetFields();
            Get.delete<AddCollectionController>();
            //Get.delete<CollectionsController>();
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
              Get.delete<AddCollectionController>();
             // Get.delete<CollectionsController>();

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

Widget statusSwitchWidget(AddCollectionController controller) {
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