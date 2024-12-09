import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';

class AddTemplateDialog extends StatefulWidget {
  final String title;
  const AddTemplateDialog({super.key, required this.title});

  @override
  State<AddTemplateDialog> createState() => _AddTemplateDialogState();
}

class _AddTemplateDialogState extends State<AddTemplateDialog> {
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
              const SizedBox(height: 24),

              // Template Name Field
              const Text(
                'Template Name',
                style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Template name',
                  hintStyle: const TextStyle(
                    fontSize: AppFontSize.bodysmall,
                    fontWeight: AppFonts.regular,
                  ),
                  filled: true,
                  fillColor: AppColors.grey.withOpacity(0.1),
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
              const SizedBox(height: 16),

              // Upload Template File
              const Text(
                'Upload Template File',
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
                    color: AppColors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Upload Template File',
                          style: TextStyle(
                            color: AppColors.grey,
                              fontSize: AppFontSize.bodysmall,
                              fontWeight: AppFonts.regular,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.upload_file,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Assign To Collection
              const Text(
                'Assign To Collection',
                style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select Collection',

                  filled: true,
                  hintStyle: const TextStyle(

                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                ),
                  fillColor: AppColors.grey.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Collection 1')),
                  DropdownMenuItem(value: '2', child: Text('Collection 2')),
                ],
                onChanged: (value) {},
                validator: (value) {
                  if (value == null) {
                    return 'Please select a collection';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

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
              const SizedBox(height: 24),

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
                  const SizedBox(width: 16),
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