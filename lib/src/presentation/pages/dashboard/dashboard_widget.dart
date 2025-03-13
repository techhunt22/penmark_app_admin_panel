import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../data/datasource/dashboard/add_template_datasource.dart';
import '../../../data/repositories_impl/dashboard/add_template_repo_impl.dart';
import '../../../domain/usecases/dashboard/add_template_usecase.dart';
import '../../controllers/dashboard/add_template_controller.dart';
import '../../widgets/profile_notification_widget.dart';
import '../templates/components/dialog_widget.dart';
import 'components/actioncard_widget.dart';
import 'components/activitytable_widget.dart';
import 'components/statcards_widget.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final AddTemplateController controller = Get.put(AddTemplateController(AddTemplateUseCase(AddTemplateRepositoryImpl(AddTemplatesDataImpl()))));


  List<String> collections = ['6780011e62f4e80bfaa452da', '2', '3'];

  Uint8List? selectedFileBytes;
  //String? selectedFileName;
  ValueNotifier<String?> selectedFileName = ValueNotifier<String?>(null);

  Future<void> selectFile() async {
    try {
      // Ensure this runs after the frame is built (for Web)
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,  // Must be true for web to allow access to file data
      );

      if (result != null && result.files.isNotEmpty) {

        selectedFileName.value = result.files.single.name;
        selectedFileBytes = result.files.single.bytes;

        if (kDebugMode) {
          print("File selected: ${selectedFileName.value}");
        }
      }else {
        if (kDebugMode) {
          print("No file selected");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error selecting file: $e");
      }
    }
  }


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.globalpadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Row(
            children: [
              Text(
                'Admin Dashboard',
                style: TextStyle(
                    fontSize: AppFontSize.displaysmall,
                    fontWeight: AppFonts.medium),
              ),
              SizedBox(width: 1015),
              ProfileNotificationWidget(),
            ],
          ),
          const SizedBox(height: gap2),
          // Stats Cards
          const Wrap(
            spacing: 30,
            runSpacing: 20,
            children: [
              StatsCardWeb(
                width: 365,
                height: 138,
                iconheight: 40,
                titlesize: AppFontSize.headlinelarge,
                subtitlesize: AppFontSize.titlemedium,
                title: 'Total Users',
                value: '12,340',
                color: AppColors.brightblue,
                icon: "icons/svg/totalusersicon.svg",
              ),
              StatsCardWeb(
                width: 365,
                height: 138,
                title: 'Templates',
                iconheight: 40,
                titlesize: AppFontSize.headlinelarge,
                subtitlesize: AppFontSize.titlemedium,
                value: '320',
                color: AppColors.purple,
                icon: "icons/svg/templateicon.svg",
              ),
              StatsCardWeb(
                width: 365,
                height: 138,
                title: 'Collections',
                iconheight: 40,
                titlesize: AppFontSize.headlinelarge,
                subtitlesize: AppFontSize.titlemedium,
                value: '45',
                color: AppColors.yellowvibrant,
                icon: "icons/svg/collectionicon.svg",
              ),
              StatsCardWeb(
                width: 365,
                height: 138,
                title: 'Pending Orders',
                iconheight: 40,
                titlesize: AppFontSize.headlinelarge,
                subtitlesize: AppFontSize.titlemedium,
                value: '15',
                color: AppColors.orangesoft,
                icon: "icons/svg/pendingordericon.svg",
              ),
            ],
          ),

          const SizedBox(height: gap2),

          // Quick Actions
          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [
              ActionCard(
                  title: 'Add Template',
                  icon: "icons/png/palette.png",
                  onTap: () async {


                      showAddTemplateDialog(
                        context: context,
                        title: "Add New Template",
                        collections: collections,
                        filenameNotifier: selectedFileName,
                        isLoading: controller.isLoading.value,
                        uploadFile: () async {
                         await selectFile();

                         if (kDebugMode) {
                           print("File selected: ${selectedFileName.value}");
                         }
                        },
                        onSubmit: (templateName, isActive, selectedCollection) async {
                          if (selectedFileBytes == null) {
                            // Handle error case: display a message or prevent submission
                            return;
                          }

                          final params = AddTemplateParams(
                            name: templateName,
                            status: isActive,
                            collectionId: selectedCollection,
                            fileBytes: selectedFileBytes!,
                            fileName: selectedFileName.value!,
                          );
                          await controller.addTemplates(params);
                          // Handle the submission here
                          if (kDebugMode) {
                            print('Is Active: $isActive');
                            print('Selected Collection: $selectedCollection');
                            print(': $selectedFileBytes');
                            print(': $selectedFileName');
                          }

                        },
                      );





                  },
                  width: 490,
                  title2: 'Add Template',
                  color: AppColors.orangesoft),
              ActionCard(
                  title: 'Create Collection',
                  icon: "icons/png/collection.png",
                  onTap: () {},
                  width: 490,
                  title2: 'Create Collection',
                  color: AppColors.purple),
              ActionCard(
                title: 'View All Templates',
                icon: "icons/png/alltemplate.png",
                onTap: () {},
                width: 490,
                title2: 'View all templates',
                color: AppColors.yellowvibrant,
              ),
            ],
          ),

          const SizedBox(height: gap2),
          // Recent Activity
          const Text(
            'Recent Activity',
            style: TextStyle(
                fontSize: AppFontSize.displaysmall,
                fontWeight: AppFonts.regular),
          ),
          const SizedBox(height: gap1),

          const ActivityTable(
            isDashboard: true,
          ),
        ],
      ),
    );
  }
}


