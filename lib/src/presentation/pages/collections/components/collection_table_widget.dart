import 'package:coloring_app_admin_panel/src/data/datasource/collection/get_collections_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/collection/get_collection_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/getcollection/collections_cache_class.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/collections/components/update_collection_dialog.dart';
import 'package:coloring_app_admin_panel/src/presentation/widgets/action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';
import '../../../../domain/usecases/collection/get_collections_usecase.dart';
import '../../../controllers/collection/getcollection/collections_controller.dart';
import '../../../widgets/body_container.dart';
import '../../../widgets/delete_dialog.dart';
import '../../../widgets/heading_container.dart';
import '../../../widgets/pagination_widget.dart';

import 'collection_dialog.dart';
import 'delete_collection_dialog.dart';

class CollectionTableWidget extends StatelessWidget {
  CollectionTableWidget({
    super.key,
  });

  final controller = Get.put(CollectionsController(
      GetCollectionsUseCase(GetCollectionRepoImpl(GetCollectionDataImpl())),
      CollectionsCache()));

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
              HeadingContainer(
                  text: 'Collection Name', flex: 4, isCenter: false),
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(
                  text: 'Number of Templates', flex: 4, isCenter: false),
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
        PaginationWidget(
          controller: controller,
        )
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                    ontap: () {

                                    }),
                                const SizedBox(width: 8),
                                ActionButton(
                                    text: "Delete",
                                    clr: AppColors.orangesoft,
                                    img: "icons/png/deleteicon.png",
                                    ontap: () {

                                    }),
                              ],
                            )),
                        Expanded(flex: 1, child: SizedBox.shrink())
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
            itemCount: controller.collections.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final collection = controller.collections[index];

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
                      text: collection.name,
                      flex: 4,
                    ),

                    const SizedBox(width: gap),
                    // Add spacing between columns

                    // Add spacing between columns
                    BodyContainer(text: collection.templatesCount.toString(), flex: 4),
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
                            color: collection.status == "active"
                                ? AppColors.brightblue.withValues(alpha: 0.5)
                                : AppColors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              collection.status,
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
                                ontap: () {
                                  showUpdateCollectionDialog(context, collection);
                                }),
                            const SizedBox(width: 8),
                            ActionButton(
                                text: "Delete",
                                clr: AppColors.orangesoft,
                                img: "icons/png/deleteicon.png",
                                ontap: () {
                                  showCollectionDeleteDialog(context: context, collection: collection);
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
        }));
  }
}



