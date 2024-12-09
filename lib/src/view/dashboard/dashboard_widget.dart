import 'package:coloring_app_admin_panel/constants/padding.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:coloring_app_admin_panel/src/view/widgets/profile_notification_widget.dart';
import 'package:coloring_app_admin_panel/src/view/dashboard/statcards_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import 'actioncard_widget.dart';
import 'activitytable_widget.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.globalpadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: gap2),
            // Stats Cards
            _buildStatsSection(),
            const SizedBox(height: gap2),
            // Quick Actions
            _buildQuickActions(),

            const SizedBox(height: gap2),
            // Recent Activity
            _buildRecentActivity(),
          ],
        ),
      ),
    );
  }
}




//AppBar Header
Widget _buildHeader() {
  return const Row(
    children: [
      Text(
        'Admin Dashboard',
        style: TextStyle(
            fontSize: AppFontSize.displaysmall, fontWeight: AppFonts.medium),
      ),
      Spacer(),
      ProfileNotificationWidget(),
    ],
  );
}


//Stats Container
Widget _buildStatsSection() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final cardWidth = constraints.maxWidth > 1200
          ? constraints.maxWidth / 4 - 15
          : constraints.maxWidth > 800
          ? constraints.maxWidth / 2 - 15
          : constraints.maxWidth;

      return Wrap(
        spacing: 20,
        runSpacing: 16,
        children: [
          StatsCard(
            width: cardWidth,
            title: 'Total Users',
            value: '12,340',
            color: AppColors.brightblue.withOpacity(0.5),
            icon: "icons/png/totalusers.png",
          ),
          StatsCard(
            width: cardWidth,
            title: 'Templates',
            value: '320',
            color: AppColors.purple.withOpacity(0.5),
            icon: "icons/png/palette.png",
          ),
          StatsCard(
            width: cardWidth,
            title: 'Collections',
            value: '45',
            color: AppColors.yellowvibrant.withOpacity(0.5),
            icon: "icons/png/collection.png",
          ),
          StatsCard(
            width: cardWidth,
            title: 'Pending Orders',
            value: '15',
            color: AppColors.orangesoft.withOpacity(0.5),
            icon: "icons/png/pendingorder.png",
          ),
        ],
      );
    },
  );
}

//Quick Action Container
Widget _buildQuickActions() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final cardWidth = constraints.maxWidth > 1200
          ? constraints.maxWidth / 3 - 15
          : constraints.maxWidth > 800
          ? constraints.maxWidth / 2 - 15
          : constraints.maxWidth;
      return Wrap(
        spacing: 20,
        runSpacing: 16,
        children: [
          ActionCard(
              title: 'Add Template',
              icon: "icons/png/palette.png",
              onTap: () {},
              width: cardWidth,
              title2: 'Add Template',
              color: AppColors.orangesoft),
          ActionCard(
              title: 'Create Collection',
              icon: "icons/png/collection.png",
              onTap: () {},
              width: cardWidth,
              title2: 'Create Collection',
              color: AppColors.purple),
          ActionCard(
            title: 'View All Templates',
            icon: "icons/png/alltemplate.png",
            onTap: () {},
            width: cardWidth,
            title2: 'View all templates',
            color: AppColors.yellowvibrant,
          ),
        ],
      );
    },
  );
}

//Recent Activity Table
Widget _buildRecentActivity() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Recent Activity',
        style: TextStyle(fontSize: AppFontSize.displaysmall, fontWeight: AppFonts.regular),
      ),
      SizedBox(height: gap1),
      ActivityTable(isDashboard: true,),
    ],
  );
}