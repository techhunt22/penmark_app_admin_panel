import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color_constants.dart';
import '../../../utils/app_routes.dart';
import '../controllers/routes/navigation_controller.dart';

class NavigationSidebar extends StatefulWidget {
  final bool isSidebaron ;
  const NavigationSidebar({super.key, required this.isSidebaron});

  @override
  State<NavigationSidebar> createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  int? _hoveredIndex;
  final controller = Get.find<NavigationController>();

  final List<Map<String, dynamic>> navItems = [
    {
      'label': 'Dashboard',
      'icon': "assets/icons/png/dashboard.png",
      'route': AppRoutes.dashboard
    },
    {
      'label': 'Templates',
      'icon': "assets/icons/png/templates.png",
      'route': AppRoutes.templates
    },
    {
      'label': 'Collections',
      'icon': "assets/icons/png/collections.png",
      'route': AppRoutes.collections
    },
    {
      'label': 'Recent Activity',
      'icon': "assets/icons/png/recentactivity.png",
      'route': AppRoutes.recentActivity
    },
    {
      'label': 'Users',
      'icon': "assets/icons/png/users.png",
      'route': AppRoutes.users
    },
    {
      'label': 'Orders',
      'icon': "assets/icons/png/orders.png",
      'route': AppRoutes.orders
    },
    {
      'label': 'Settings',
      'icon': "assets/icons/png/settings.png",
      'route': AppRoutes.settings
    },
    {
      'label': 'Logout',
      'icon': "assets/icons/png/logouticon.png",
      'route': AppRoutes.logout
    },
  ];
  final dashboardcontroller = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mainNavItems = navItems.sublist(0, navItems.length - 1);
    final Map<String, dynamic> logoutItem = navItems.last;

    return Container(
      width: 300,
      height: MediaQuery.sizeOf(context).height,
      decoration:  BoxDecoration(
        borderRadius: widget.isSidebaron ? BorderRadiusDirectional.only(
            topEnd: Radius.circular(35), bottomEnd: Radius.circular(35)):
            BorderRadiusDirectional.only(
            topStart: Radius.circular(35), bottomStart: Radius.circular(35)),
        color: Color(0xFF1A1F37),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10, top: 30),
        child: SingleChildScrollView(
          child: Column(

            children: [
              // Logo
              Image.asset(
                'icons/png/logo.png',
                height: 137,
              ),

              const SizedBox(
                height: gap4,
              ),

              ...mainNavItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return _buildNavItem(
                  label: item['label'],
                  icon: item['icon'],
                  index: index,
                  ontap: (index) {
                    Scaffold.of(context).closeEndDrawer();
                    controller.updateSelectedIndex(index); // Update selected index
                    controller.changePage(item['route']);
                  },
                );
              }),




              // Logout Item
              _buildNavItem(
                label: logoutItem['label'],
                icon: logoutItem['icon'],
                index: navItems.length - 1,
                ontap: (index) {
                  Scaffold.of(context).closeEndDrawer();
                  controller.updateSelectedIndex(index); // Update selected index
                  controller.handleLogout(context); // Call logout method
                },
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required int index,
    required String icon,
    required void Function(int) ontap,
  }) {
    final bool isHovered = _hoveredIndex == index;
    final bool isSelected = controller.selectedIndex.value == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: Container(

        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHovered || isSelected
                ? AppColors.yellowvibrant
                : AppColors.white.withOpacity(0.1)),

        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          horizontalTitleGap: 20,
          minVerticalPadding: 16,
          leading: Image.asset(
            icon,
            color: isHovered || isSelected ? AppColors.black : AppColors.white,
            height: 20,
            width: 20,
            filterQuality: FilterQuality.high,
            fit: BoxFit.fill,
          ),

          title: Text(
            label,
            style: TextStyle(
                color:
                    isHovered || isSelected ? AppColors.black : AppColors.white,
                fontWeight: AppFonts.medium,

                fontSize: AppFontSize.titlesmall),
          ),
          onTap: () => ontap(index),
        ),
      ),
    );
  }
}
