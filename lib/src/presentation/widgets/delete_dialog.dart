import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';


class DeleteDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  final VoidCallback cancel;
  final VoidCallback save;
  const DeleteDialog({super.key, required this.title, required this.subtitle, required this.img, required this.cancel, required this.save});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 524,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [

            Image.asset(img),

            Text(
             title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: AppFontSize.headlinelarge,
                fontWeight: AppFonts.medium,
                color: AppColors.red
              ),
            ),
            const SizedBox(height: gap2),

            // Template Name Field
             Text(
              subtitle,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: AppFontSize.titlemedium,
                fontWeight: AppFonts.regular,
              ),
            ),


            const SizedBox(height: gap2),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: cancel,
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
                        color: AppColors.warmgray
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: save,
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
                          color: AppColors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

