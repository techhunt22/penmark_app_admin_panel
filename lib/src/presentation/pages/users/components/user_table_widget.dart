import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../../utils/app_routes.dart';
import '../../../controllers/routes/navigation_controller.dart';
import '../../../widgets/pagination_widget.dart';
import '../../templates/components/dialog_widget.dart';



class UserTableWidget extends StatelessWidget {

  const UserTableWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

    return Column(
      children: [
        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildHeadingContainer('User Name', 4),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Email', 4),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Status', 4),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Actions', 4),

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
        const PaginationWidget()
      ],
    );



  }





}


Widget buildListView(NavigationController dashboardController) {
  return ListView.builder(
    itemCount: 7,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
                flex: 4,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: AppColors.purple,
                      child: Text("JD",
                        style: TextStyle(
                            fontSize: AppFontSize.bodymedium,
                            fontWeight: AppFonts.regular,
                            color: AppColors.white
                        ),
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                    SizedBox(width: 10,),
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


            _buildContainer(
                'john.doe@example.com',
                4),

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
                    color: AppColors.brightblue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Active",
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

                  children: [
                    _buildActionButton(
                        text: "View",
                        img: "icons/png/newtab.png",
                        clr: AppColors.brightblue,
                        ontap: (){
                          dashboardController.changePage(AppRoutes.usersdetail,);

                        }
                    ),
                    const SizedBox(width: 8),

                    // _buildActionButton(
                    //     text: "Edit",
                    //     img: "icons/png/newtab.png",
                    //     clr: AppColors.purple,
                    //     ontap: (){
                    //       showAddTemplateDialog(context, 'Edit Template');
                    //
                    //     }
                    // ),
                    // const SizedBox(width: 8),
                    // _buildActionButton(
                    //     text: "Delete",
                    //     clr: AppColors.orangesoft,
                    //     img: "icons/png/deleteicon.png",
                    //     ontap: (){
                    //       showDeleteDialog(
                    //           context: context,
                    //           text: 'Are you sure you want to delete this user account?',
                    //         subtitle: "This action cannot be undone.",
                    //         img: 'assets/icons/png/personiconred.png'
                    //       );
                    //
                    //     }
                    // ),
                  ],
                )),
            // Reduced flex for actions
          ],
        ),
      );
    },
  );
}

Widget _buildHeadingContainer(String text, int flex) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left, // Align text to the left

      style: const TextStyle(
          fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.bold),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _buildContainer(String text, int flex) {
  return Expanded(
    flex: flex,
    child: Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.left, // Align text to the left

      style: const TextStyle(
          fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.regular),
      overflow: TextOverflow.ellipsis,
    ),
  );
}


Widget _buildActionButton({required String text,required VoidCallback ontap, required String img, required Color clr}) {
  return Container(
      constraints: const BoxConstraints(maxWidth: 120),
      child: CustomTextIconButton(
          onPressed: ontap,
          height:45 ,
          width: 115,
          text:  text,
          color: clr,
          borderradius: 8,
          fontsize:  AppFontSize.bodysmall2,
          textcolor:AppColors.black,
          opacity: 0.2,
          img: img
      )



  );
}

void showAddTemplateDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AddTemplateDialog(title: text,),
  );
}



