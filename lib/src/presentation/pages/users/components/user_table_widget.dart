import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/user/get_user_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/user/get_users_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/user/get_users_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/user/users_cache.dart';
import 'package:coloring_app_admin_panel/src/presentation/widgets/action_button.dart';
import 'package:coloring_app_admin_panel/src/presentation/widgets/body_container.dart';
import 'package:coloring_app_admin_panel/src/presentation/widgets/heading_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../utils/app_routes.dart';
import '../../../../data/datasource/users/get_users_datasource.dart';
import '../../../controllers/routes/navigation_controller.dart';
import '../../../widgets/pagination_widget.dart';

class UserTableWidget extends StatelessWidget {
  UserTableWidget({
    super.key,
  });

  final controller = Get.put(GetUsersController(
      GetUsersUseCase(GetUsersRepoImpl(GetUsersDataImpl())), UsersCache()));

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

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
              HeadingContainer(text: 'User Name',flex:5,isCenter:false),
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(text: 'Email',flex: 5,isCenter: false),
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(text:'Status', flex: 4,isCenter:  false),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              HeadingContainer(text: 'Actions',flex: 4,isCenter:  true),


              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    controller.refreshData();

                  },
                  icon: Icon(Icons.refresh_outlined),),
              )

              // Reduced flex for actions
            ],
          ),
        ),

        const SizedBox(
          height: gap1,
        ),

        buildListView(dashboardController),

        const SizedBox(height: gap),

        // Pagination
        PaginationWidget(controller: controller)
      ],
    );
  }

Widget buildListView(NavigationController dashboardController) {
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
                    const Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 19,
                              child: Text(
                                "JD",
                                style: TextStyle(
                                  fontSize: AppFontSize.bodymedium,
                                  fontWeight: AppFonts.regular,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "John Doe",
                              maxLines: 4,
                              textAlign: TextAlign.left,
                              // Align text to the left

                              style: TextStyle(
                                  fontSize: AppFontSize.bodymedium,
                                  fontWeight: AppFonts.regular),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),

                    const SizedBox(width: gap),

                    BodyContainer(text: 'john.doe@example.com', flex: 5),

                    const SizedBox(width: gap),

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
                          child: const Center(
                            child: Text(
                              "Active",
                              style: TextStyle(
                                fontSize: AppFontSize.bodysmall2,
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
                                text: "View",
                                img: "icons/png/newtab.png",
                                clr: AppColors.brightblue,
                                ontap: () {}),
                          ],
                        )),

                    Expanded(flex: 1, child: SizedBox()),
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
        itemCount: controller.users.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final users = controller.users[index];
          final name = controller.getInitials(users.fullname);

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
                    flex: 5,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 19,
                          backgroundColor: AppColors.purple,
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: AppFontSize.bodymedium,
                                fontWeight: AppFonts.regular,
                                color: AppColors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          users.fullname,
                          maxLines: 4,
                          textAlign: TextAlign.left,
                          // Align text to the left

                          style: TextStyle(
                              fontSize: AppFontSize.bodymedium,
                              fontWeight: AppFonts.regular),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),

                const SizedBox(width: gap),

                BodyContainer(text: users.email, flex: 5),

                const SizedBox(width: gap),

                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 36,
                      constraints: const BoxConstraints(maxWidth: 108),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: users.status == "active"
                            ? AppColors.brightblue.withValues(alpha: 0.5)
                            : AppColors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          users.status,
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
                            text: "View",
                            img: "icons/png/newtab.png",
                            clr: AppColors.brightblue,
                            ontap: () {
                              dashboardController.changePage(
                                AppRoutes.usersdetail,
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

