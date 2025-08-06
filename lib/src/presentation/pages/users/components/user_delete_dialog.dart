
import 'package:coloring_app_admin_panel/src/data/datasource/users/delete_user_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/user/delete_user_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/user/get_user_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/user/delete_user_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/user/deleteuser/delete_user_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/user/getuser/get_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';

Future<void> showUserDeleteDialog({
  required BuildContext context,
  required String title,
  required String subtitle,
 // required GetUsersDataEntity user,
}) async {

  final delete = Get.put(DeleteUserController(
      DeleteUserUseCase(DeleteUserRepoImpl(DeleteUserDataImpl())),


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
                  : actionButtonWidget(delete),
            ),
          ],
        ),
      )
  );
}

Widget actionButtonWidget(DeleteUserController delete,) {
  return Row(
    children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () {
            if (Get.isDialogOpen ?? false) {
              Get.close(1); // Closes the dialog only
            }
            Get.delete<DeleteUserController>();
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
            delete.deleteUser(
              userId: "67ffcd1609873aaa6d5b355c",

              onSuccess: () async {
                if (Get.isDialogOpen ?? false) {
                  Get.close(1); // Closes the dialog only
                }

                Get.delete<DeleteUserController>();
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
