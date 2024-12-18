import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/padding.dart';
import '../../../../../constants/size_constant.dart';
import '../../../widgets/profile_notification_widget.dart';

import '../web/components/actioncard_widget.dart';
import '../web/components/activitytable_widget.dart';
import '../web/components/statcards_widget.dart';
class LaptopWidget extends StatelessWidget {
  const LaptopWidget({super.key});

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
                    fontSize: AppFontSize.displaysmall, fontWeight: AppFonts.medium),
              ),
              Spacer(),
              ProfileNotificationWidget(),
            ],
          ),
          const SizedBox(height: gap2),
          // Stats Cards
          Wrap(
            spacing: 20,
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
            spacing: 25,
            runSpacing: 20,
            children: [
              ActionCard(
                  title: 'Add Template',
                  icon: "icons/png/palette.png",
                  onTap: () {},
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
          Text(
            'Recent Activity',
            style: TextStyle(fontSize: AppFontSize.displaysmall, fontWeight: AppFonts.regular),
          ),
          SizedBox(height: gap1),
          ActivityTable(isDashboard: true,),
        ],
      ),
    );
  }
}
