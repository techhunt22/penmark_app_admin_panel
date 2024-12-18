import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/padding.dart';
import '../../../controllers/routes/navigation_controller.dart';
import '../mobile/mobile_widget.dart';


class TabletWidget extends StatelessWidget {
  const TabletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();


    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Text(
            'Admin Dashboard',
            style: TextStyle(
                fontSize: AppFontSize.headlinemedium,
                fontWeight: AppFonts.medium),
          ),
        ),
        statsWidget(),

        const SizedBox(
          height: gap3,
        ),

        actionWidget(),

        Padding(
          padding: AppPadding.globalpadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Recent Activity',
                style: TextStyle(
                    fontSize: AppFontSize.headlinemedium,
                    fontWeight: AppFonts.medium),
              ),
              const SizedBox(
                height: gap1,
              ),


              ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                itemBuilder: (context, index) {

                  return   recentActivityCardWidget(dashboardController);
                },

              )

            ],
          ),
        ),
      ],
    );
  }
}