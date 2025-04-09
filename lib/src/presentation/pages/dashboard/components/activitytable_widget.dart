import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:coloring_app_admin_panel/utils/CustomWidgets/custom_buttons.dart';
import 'package:coloring_app_admin_panel/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/routes/navigation_controller.dart';



class ActivityTable extends StatelessWidget {
  final bool isDashboard;

  const ActivityTable({super.key, required this.isDashboard});

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

    return Column(
      children: [
        Container(
          height: 75,
          width: 1550,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildHeadingContainer('User Name', 2, false),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Activity Type', 2,false),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Description', 4,false),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Date & Time', 2,false),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildHeadingContainer('Actions', 1,true),
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

        // isDashboard ? const SizedBox.shrink()
        //     : const PaginationWidget()
      ],
    );
  }


}

Widget buildListView(NavigationController dashboardController) {
  return SizedBox(

    width: 1550,
    child: ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 75,
          width: 1550,

          padding: const EdgeInsets.symmetric(horizontal: 25),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 19,
                        backgroundColor: AppColors.purple,
                        child: Text(
                          "JD",
                          style: TextStyle(
                              fontSize: AppFontSize.bodymedium,
                              color: AppColors.white,
                              fontWeight: AppFonts.regular),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child:Text(
                          "John Doe",
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          // Align text to the left

                          style: TextStyle(
                              fontSize: AppFontSize.bodymedium,
                              fontWeight: AppFonts.regular),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )),

              const SizedBox(width: gap),
              // Add spacing between columns
              _buildContainer('User Ordered for Print', 2),
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildContainer(
                  'John Doe saved progress on '
                      'Floral Design'
                      ' template.',
                  4),
              // Increased flex for description
              const SizedBox(width: gap),
              // Add spacing between columns
              _buildContainer('Nov 20, 2024, 10:00 AM', 2),
              const SizedBox(width: gap),
              // Add spacing between columns
              Expanded(
                  flex: 1,
                  child: CustomTextIconButton(
                      onPressed: (){
                        dashboardController.changePage(AppRoutes.usersdetail);
                      },
                      height:45 ,
                      width: 115,
                      text:  "View Profile",
                      color: AppColors.brightblue,
                      borderradius: 8,
                      fontsize: AppFontSize.bodysmall2,
                      textcolor:AppColors.black,
                      opacity: 0.2,
                      img: "icons/png/newtab.png"
                  )




              ),
              // Reduced flex for actions
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildHeadingContainer(String text, int flex ,bool isCenter) {
  return Expanded(
    flex: flex,
    child: Align(
      alignment: isCenter ? Alignment.center : Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 1,
        textAlign: TextAlign.left, // Align text to the left

        style: const TextStyle(
            fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.bold),
        overflow: TextOverflow.ellipsis,
      ),
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


