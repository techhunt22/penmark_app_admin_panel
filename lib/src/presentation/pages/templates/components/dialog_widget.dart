import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';

Future<void> showAddTemplateDialog({
  required BuildContext context,
  required String title,
  required ValueNotifier<String?> filenameNotifier,
  required VoidCallback uploadFile,
 required bool isLoading ,

required Function(
          String templateName, String isActive, String selectedCollection)
      onSubmit,
  required List<String> collections,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final formKey = GlobalKey<FormState>();
      final TextEditingController templateController = TextEditingController();
      bool isActive = false;
      String? selectedCollection;

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: AppFontSize.headlinelarge,
                        fontWeight: AppFonts.medium,
                      ),
                    ),
                    const SizedBox(height: gap2),

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
                      controller: templateController,
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
                    ),
                    const SizedBox(height: gap),

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
                      onTap: uploadFile,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.gray.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ValueListenableBuilder<String?>(
                                valueListenable: filenameNotifier,
                                builder: (context, filename, _) {
                                  return Text(
                                    filename ?? "No file selected",
                                    style: TextStyle(

                                      fontSize: AppFontSize.bodymedium,
                                      fontWeight: AppFonts.regular,
                                    ),
                                  );
                                },
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
                    const SizedBox(height: gap),

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
                        hoverColor: AppColors.gray.withValues(alpha: 0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedCollection,
                      // This is the selected value

                      items: collections.map((collection) {
                        return DropdownMenuItem<String>(
                          value: collection,
                          child: Text(collection),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCollection = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a collection';
                        }
                        return null;
                      },
                    ),
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
                        Text(isActive ? "Active" : "Disabled"),
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
                              Get.back();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side:
                                  const BorderSide(color: AppColors.brightblue),
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
                        isLoading ?
                            SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(color: AppColors.gray,)):
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true; // Set loading to true when API call starts
                                });

                                String templateName =
                                    templateController.text.trim();
                                String status = isActive
                                    ? "active"
                                    : "inactive"; // or "disabled" based on your API
                                await Future.delayed(Duration(seconds: 3)); // Wait for UI to rebuild

                                onSubmit(
                                    templateName, status, selectedCollection!);



                                setState(() {
                                  isLoading = false; // Set loading to true when API call starts

                                  templateController.clear(); // Clear the TextEditingController
                                  isActive = false; // Reset the Switch state
                                  selectedCollection = null; // Clear the selected collection
                                  filenameNotifier.value = "No File Selected";
                                });
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
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

// class AddTemplateDialog extends StatefulWidget {
//   final String title;
//   final VoidCallback uploadfile;
//   final VoidCallback submit;
//
//    const AddTemplateDialog({super.key, required this.title, required this.uploadfile, required this.submit, });
//
//   @override
//   State<AddTemplateDialog> createState() => _AddTemplateDialogState();
// }
//
// class _AddTemplateDialogState extends State<AddTemplateDialog> {
//   bool isActive = false;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _templateController = TextEditingController();
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
//                Text(
//                widget.title,
//                 style: const TextStyle(
//                   fontSize: AppFontSize.headlinelarge,
//                   fontWeight: AppFonts.medium,
//                 ),
//               ),
//               const SizedBox(height: gap2),
//               // Template Name Field
//               const Text(
//                 'Template Name',
//                 style: TextStyle(
//                   fontSize: AppFontSize.bodymedium,
//                   fontWeight: AppFonts.regular,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _templateController,
//                 decoration: InputDecoration(
//                   hintText: 'Template name',
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
//               // Upload Template File
//               const Text(
//                 'Upload Template File',
//                 style: TextStyle(
//                   fontSize: AppFontSize.bodymedium,
//                   fontWeight: AppFonts.regular,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               InkWell(
//                 onTap: widget.uploadfile,
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
//                               fontSize: AppFontSize.bodysmall,
//                               fontWeight: AppFonts.regular,
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
//               const SizedBox(height: gap),
//
//               // Assign To Collection
//               const Text(
//                 'Assign To Collection',
//                 style: TextStyle(
//                   fontSize: AppFontSize.bodymedium,
//                   fontWeight: AppFonts.regular,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   hintText: 'Select Collection',
//
//                   filled: true,
//                   hintStyle: const TextStyle(
//
//                     fontSize: AppFontSize.bodymedium,
//                     fontWeight: AppFonts.regular,
//                 ),
//                   fillColor: AppColors.gray.withValues(alpha:0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 items: const [
//                   DropdownMenuItem(value: '1', child: Text('Collection 1')),
//                   DropdownMenuItem(value: '2', child: Text('Collection 2')),
//                   DropdownMenuItem(value: '3', child: Text('Collection 2')),
//                   DropdownMenuItem(value: '4', child: Text('Collection 2')),
//                   DropdownMenuItem(value: '5', child: Text('Collection 2')),
//                   DropdownMenuItem(value: '6', child: Text('Collection 2')),
//                 ],
//                 onChanged: (value) {},
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a collection';
//                   }
//                   return null;
//                 },
//               ),
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
//
//                   Text(
//                       isActive ?
//                       "Active" : "Disabled"),
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
//                           widget.submit();
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
