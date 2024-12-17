import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';


class CollectionDialog extends StatefulWidget {
  final String title;
  const CollectionDialog({super.key, required this.title});

  @override
  State<CollectionDialog> createState() => _CollectionDialogState();
}

class _CollectionDialogState extends State<CollectionDialog> {
  bool isActive = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: AppFontSize.headlinelarge,
                  fontWeight: AppFonts.medium,
                ),
              ),
              const SizedBox(height: gap2),

              // Template Name Field
              const Text(
                'Collection Name',
                style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Collection Name',
                  hintStyle: const TextStyle(
                    fontSize: AppFontSize.bodysmall,
                    fontWeight: AppFonts.regular,
                  ),
                  filled: true,
                  fillColor: AppColors.gray.withOpacity(0.1),
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
              ),
              const SizedBox(height: gap),

              // Upload Template File
              const Text(
                'Collection Cover Image',
                style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  // Add file picker logic here
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.gray.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Upload Template File',
                          style: TextStyle(
                            color: AppColors.gray,
                            fontSize: AppFontSize.bodysmall,
                            fontWeight: AppFonts.regular,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.upload_file,
                        color: AppColors.gray,
                      ),
                    ],
                  ),
                ),
              ),

              // Assign To Collection

              const SizedBox(height: gap),

              // Template Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Template Status',
                    style: TextStyle(
                      fontSize: AppFontSize.bodymedium,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                  Switch(
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                    activeColor: AppColors.brightblue,
                  ),
                ],
              ),
              const SizedBox(height: gap2),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                        if (_formKey.currentState!.validate()) {
                          // Handle save logic here
                        }
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}