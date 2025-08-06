import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:coloring_app_admin_panel/src/data/datasource/template/get_templates_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/template/get_templates_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/get_templates_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/templates_cache.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/templates/components/update_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../data/datasource/template/delete_template_datasource.dart';
import '../../../../data/repositories_impl/template/delete_template_repo_impl.dart';
import '../../../../domain/usecases/template/delete_template_usecase.dart';
import '../../../controllers/template/deletetemplate/delete_template_controller.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/body_container.dart';
import '../../../widgets/delete_dialog.dart';
import '../../../widgets/heading_container.dart';
import '../../../widgets/pagination_widget.dart';

class TemplateTableWidgets extends StatelessWidget {
  TemplateTableWidgets({
    super.key,
  });

  final controller = Get.put(TemplatesController(
      GetTemplatesUseCase(GetTemplatesRepoImpl(GetTemplatesDataImpl())),
      TemplatesCache()));


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 1550,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HeadingContainer(text: 'Template Name', flex: 4, isCenter: false),
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(text: 'Collection', flex: 4, isCenter: false),
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(text: 'Status', flex: 4, isCenter: false),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(text: 'Actions', flex: 4, isCenter: true),

              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    controller.refreshData();
                  },
                  icon: Icon(Icons.refresh_outlined),
                ),
              )

              // Reduced flex for actions
            ],
          ),
        ),
        const SizedBox(
          height: gap1,
        ),

        buildListView(),

        const SizedBox(height: gap),

        // Pagination
        PaginationWidget(controller: controller)
      ],
    );
  }

  Widget buildListView() {
    return SizedBox(
      width: 1550,
      child: Obx(() {
        if (controller.isLoading.value) {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 75,
                  width: 1550,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Text(
                            "asdsadas",
                            maxLines: 4,
                            textAlign: TextAlign.left,
                            // Align text to the left

                            style: const TextStyle(
                                fontSize: AppFontSize.bodymedium,
                                fontWeight: AppFonts.regular),
                            overflow: TextOverflow.ellipsis,
                          )),

                      const SizedBox(width: gap),
                      // Add spacing between columns

                      // Add spacing between columns
                      BodyContainer(text: "asdasdasd", flex: 4),
                      // Increased flex for description
                      const SizedBox(width: gap),
                      // Add spacing between columns
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 36,
                            constraints: const BoxConstraints(maxWidth: 108),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                  fontSize: AppFontSize.bodysmall2,
                                  color: AppColors.black,
                                  fontWeight: AppFonts.regular,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: gap),

                      // Add spacing between columns
                      Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ActionButton(
                                  text: "Edit",
                                  img: "icons/png/newtab.png",
                                  clr: AppColors.purple,
                                  ontap: () {}),
                              const SizedBox(width: 8),
                              ActionButton(
                                  text: "Delete",
                                  clr: AppColors.orangesoft,
                                  img: "icons/png/deleteicon.png",
                                  ontap: () {}),
                            ],
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                      // Reduced flex for actions
                    ],
                  ),
                );
              },
            ),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return ListView.builder(
          itemCount: controller.templates.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final template = controller.templates[index];

            return Container(
              height: 75,
              width: 1550,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BodyContainer(
                    text: template.name,
                    flex: 4,
                  ),

                  const SizedBox(width: gap),
                  // Add spacing between columns

                  // Add spacing between columns
                  BodyContainer(text: template.collectionname, flex: 4),
                  // Increased flex for description
                  const SizedBox(width: gap),
                  // Add spacing between columns
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 36,
                        constraints: const BoxConstraints(maxWidth: 108),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: template.status == "active"
                              ? AppColors.brightblue.withValues(alpha: 0.5)
                              : AppColors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            template.status,
                            style: TextStyle(
                              fontSize: AppFontSize.bodysmall2,
                              color: AppColors.black,
                              fontWeight: AppFonts.regular,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: gap),

                  // Add spacing between columns
                  Expanded(
                      flex: 4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActionButton(
                              text: "Edit",
                              img: "icons/png/newtab.png",
                              clr: AppColors.purple,
                              ontap: () {
                                showUpdateTemplateDialog(context, template);
                              }),
                          const SizedBox(width: 8),
                          ActionButton(
                              text: "Delete",
                              clr: AppColors.orangesoft,
                              img: "icons/png/deleteicon.png",
                              ontap: () {

                                showDeleteDialog(
                                  context: context,
                                  template: template,
                                  title: 'Delete Template?',
                                  subtitle: 'Are you sure you want to delete this template?',

                                );

                              }),
                        ],
                      )),
                  Expanded(flex: 1, child: SizedBox()),
                  // Reduced flex for actions
                ],
              ),
            );
          },
        );
      }),
    );
  }


}
