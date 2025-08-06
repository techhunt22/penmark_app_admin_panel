
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';
import '../../../../data/datasource/collection/delete_collection_datasource.dart';
import '../../../../data/repositories_impl/collection/delete_collection_repo_impl.dart';
import '../../../../domain/entities/collection/get_collection_entities.dart';
import '../../../../domain/usecases/collection/delete_collection_usecase.dart';
import '../../../controllers/collection/deletecollection/delete_collection_controller.dart';
import '../../../controllers/collection/getcollection/collections_controller.dart';

Future<void> showCollectionDeleteDialog({
  required BuildContext context,
  required GetCollectionDataEntity collection,
}) async {

  final delete = Get.put(DeleteCollectionController(
      DeleteCollectionUseCase(DeleteCollectionRepoImpl(DeleteCollectionDataImpl())),
      Get.find<CollectionsController>()

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
              "Delete Collection",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: AppFontSize.headlinelarge,
                fontWeight: AppFonts.medium,
                color: AppColors.red,
              ),
            ),
            const SizedBox(height: gap2),
            Text(
              "Are you sure you want to delete this collection?",
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
                  : actionButtonWidget(delete, collection),
            ),
          ],
        ),
      )
  );
}

Widget actionButtonWidget(DeleteCollectionController delete, GetCollectionDataEntity template) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            if (Get.isDialogOpen ?? false) {
              Get.close(1); // Closes the dialog only
            }
            Get.delete<DeleteCollectionController>();
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
            delete.deleteCollection(
              templateId: template.id,

              onSuccess: () async {
                if (Get.isDialogOpen ?? false) {
                  Get.close(1); // Closes the dialog only
                }

                Get.delete<DeleteCollectionController>();
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
