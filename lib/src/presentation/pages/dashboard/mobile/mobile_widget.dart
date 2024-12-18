import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/padding.dart';
import '../../../../../constants/size_constant.dart';
import '../../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../../utils/app_routes.dart';
import '../../../controllers/routes/navigation_controller.dart';
import 'components/action_card_mob.dart';
import 'components/stats_card_mob.dart';

class MobileWidget extends StatelessWidget {
  const MobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

    return Column(
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

Widget recentActivityCardWidget(NavigationController dashboardController) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: 363,
      height: 233,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(23)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  'John Doe',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: AppFontSize.titlelarge,
                      fontWeight: AppFonts.medium),
                ),
              ),
              SizedBox(width: gap),
              CustomTextIconButton(
                  onPressed: () {
                    dashboardController
                        .changePage(AppRoutes.usersdetail);
                  },
                  text: "View Details",
                  color: AppColors.brightblue,
                  borderradius: 8,
                  height: 40,
                  width: 96,
                  fontsize: AppFontSize.bodysmall2,
                  textcolor: AppColors.black,
                  opacity: 0.2,
                  img: "icons/png/newtab.png")
            ],
          ),

          Text(
            'John Doe saved progress on Floral Design template.',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: AppFontSize.bodymedium,
                fontWeight: AppFonts.regular),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Activity Type:", style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.semiBold),),
              SizedBox(width: gap),
              Flexible(
                child: Text("User Saved Work",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: AppFontSize.bodymedium,
                      fontWeight: AppFonts.regular),),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date & Time:", style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.semiBold),),
              SizedBox(width: gap),
              Flexible(
                child: Text("Nov 20, 2024, 10:00 AM",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: AppFontSize.bodymedium,
                      fontWeight: AppFonts.regular),),
              ),
            ],
          ),





        ],
      ),
    ),
  );
}



Widget actionWidget() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ActionCardMob(
              title: 'Add Template',
              icon: "icons/png/palette.png",
              onTap: () {},
              width: 195,
              title2: 'Add Template',
              color: AppColors.orangesoft),
          const SizedBox(
            width: gap1,
          ),
          ActionCardMob(
              title: 'Create Collection',
              icon: "icons/png/collection.png",
              onTap: () {},
              width: 195,
              title2: 'Create Collection',
              color: AppColors.purple),
          const SizedBox(
            width: gap1,
          ),
          ActionCardMob(
            title: 'View All Templates',
            icon: "icons/png/alltemplate.png",
            onTap: () {},
            width: 195,
            title2: 'View all templates',
            color: AppColors.yellowvibrant,
          ),
        ],
      ),
    ),
  );
}


Widget statsWidget() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StatsCardMob(
            width: 117,
            height: 117,
            iconheight: 25,
            titlesize: AppFontSize.titlesmall,
            subtitlesize: AppFontSize.bodysmall2,
            title: 'Total Users',
            value: '12,340',
            color: AppColors.brightblue.withOpacity(0.5),
            icon: "icons/svg/totalusersicon.svg",
          ),
          const SizedBox(
            width: gap1,
          ),
          StatsCardMob(
            width: 117,
            height: 117,
            iconheight: 25,
            titlesize: AppFontSize.titlesmall,
            subtitlesize: AppFontSize.bodysmall2,
            title: 'Templates',
            value: '320',
            color: AppColors.purple.withOpacity(0.5),
            icon: "icons/svg/templateicon.svg",
          ),
          const SizedBox(
            width: gap1,
          ),
          StatsCardMob(
            width: 117,
            height: 117,
            iconheight: 25,
            titlesize: AppFontSize.titlesmall,
            subtitlesize: AppFontSize.bodysmall2,
            title: 'Collections',
            value: '45',
            color: AppColors.yellowvibrant.withOpacity(0.5),
            icon: "icons/svg/collectionicon.svg",
          ),
          const SizedBox(
            width: gap1,
          ),
          StatsCardMob(
            width: 117,
            height: 117,
            iconheight: 25,
            titlesize: AppFontSize.titlesmall,
            subtitlesize: AppFontSize.bodysmall2,
            title: 'Pending Orders',
            value: '15',
            color: AppColors.orangesoft.withOpacity(0.5),
            icon: "icons/svg/pendingordericon.svg",
          ),
        ],
      ),
    ),
  );
}