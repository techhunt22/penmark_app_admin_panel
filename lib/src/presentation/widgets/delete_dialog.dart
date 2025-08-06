import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../data/datasource/template/delete_template_datasource.dart';
import '../../data/datasource/template/get_templates_datasource.dart';
import '../../data/repositories_impl/template/delete_template_repo_impl.dart';
import '../../data/repositories_impl/template/get_templates_repo_impl.dart';
import '../../domain/entities/template/get_templates_entity.dart';
import '../../domain/usecases/template/delete_template_usecase.dart';
import '../../domain/usecases/template/get_templates_usecase.dart';
import '../controllers/template/deletetemplate/delete_template_controller.dart';
import '../controllers/template/gettemplates/get_templates_controller.dart';
import '../controllers/template/gettemplates/templates_cache.dart';

// class DeleteDialog extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String img;
//   final VoidCallback cancel;
//   final VoidCallback save;
//   const DeleteDialog({super.key, required this.title, required this.subtitle, required this.img, required this.cancel, required this.save});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//       Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Container(
//         width: 524,
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center ,
//           children: [
//
//             Image.asset(img),
//
//             Text(
//              title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: AppFontSize.headlinelarge,
//                 fontWeight: AppFonts.medium,
//                 color: AppColors.red
//               ),
//             ),
//             const SizedBox(height: gap2),
//
//             // Template Name Field
//              Text(
//               subtitle,
//               textAlign: TextAlign.center,
//
//               style: const TextStyle(
//                 fontSize: AppFontSize.titlemedium,
//                 fontWeight: AppFonts.regular,
//               ),
//             ),
//
//
//             const SizedBox(height: gap2),
//
//             // Action Buttons
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: cancel,
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 25),
//                       side: const BorderSide(color: AppColors.warmgray),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Cancel',
//                       style: TextStyle(
//                         fontSize: AppFontSize.titlesmall,
//                         fontWeight: AppFonts.medium,
//                         color: AppColors.warmgray
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: save,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 25),
//                       backgroundColor: AppColors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Save',
//                       style: TextStyle(
//                           fontSize: AppFontSize.titlesmall,
//                           fontWeight: AppFonts.medium,
//                           color: AppColors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

Future<void> showDeleteDialog({
  required BuildContext context,
  required String title,
  required String subtitle,
  required GetTemplatesDataEntity template,
}) async {

  final delete = Get.put(DeleteTemplateController(
      DeleteTemplateUseCase(DeleteTemplatesRepoImpl(DeleteTemplateDataImpl())),
      Get.find<TemplatesController>()

  )
  );

  Get.defaultDialog(
    title: '',
    radius: 15,
    barrierDismissible: false,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'icons/png/deleteiconred.png',
          ),
          const SizedBox(height: gap),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppFontSize.headlinelarge,
              fontWeight: AppFonts.medium,
              color: AppColors.red,
            ),
          ),
          const SizedBox(height: gap2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppFontSize.titlemedium,
              fontWeight: AppFonts.regular,
            ),
          ),
          const SizedBox(height: gap2),
          Obx(
                () => delete.isLoading.value
                ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primarycolor,
                ))
                : actionButtonWidget(delete, template),
          ),
        ],
      ),
    )
  );
}

Widget actionButtonWidget(DeleteTemplateController delete, GetTemplatesDataEntity template) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            if (Get.isDialogOpen ?? false) {
              Get.close(1); // Closes the dialog only
            }
            Get.delete<DeleteTemplateController>();
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 25),
            side: const BorderSide(color: AppColors.warmgray),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: AppFontSize.titlesmall,
              fontWeight: AppFonts.medium,
              color: AppColors.warmgray,
            ),
          ),
        ),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            delete.deleteTemplate(
              templateId: template.id,

              onSuccess: () async {
                if (Get.isDialogOpen ?? false) {
                  Get.close(1); // Closes the dialog only
                }

                Get.delete<DeleteTemplateController>();
              },
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 25),
            backgroundColor: AppColors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              fontSize: AppFontSize.titlesmall,
              fontWeight: AppFonts.medium,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
