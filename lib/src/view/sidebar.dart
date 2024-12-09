import 'package:coloring_app_admin_panel/constants/font_family.dart';
import 'package:coloring_app_admin_panel/constants/font_size.dart';
import 'package:coloring_app_admin_panel/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';
import '../../utils/app_routes.dart';
import '../viewmodel/routes/dashboard_controller.dart';

class NavigationSidebar extends StatefulWidget {
  const NavigationSidebar({super.key});

  @override
  State<NavigationSidebar> createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  int _selectedIndex = 0;
  int? _hoveredIndex;
  final controller = Get.find<DashboardController>();

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

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mainNavItems = navItems.sublist(0, navItems.length - 1);
    final Map<String, dynamic> logoutItem = navItems.last;

    return Container(
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(35), bottomEnd: Radius.circular(35)),
        color: Color(0xFF1A1F37),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
                  setState(() {
                    _selectedIndex = index; // Update index
                  });
                  controller.changePage(item['route']);
                },
              );
            }),

            const Spacer(),

            // Logout Item
            _buildNavItem(
              label: logoutItem['label'],
              icon: logoutItem['icon'],
              index: navItems.length - 1,
              ontap: (index) {
                setState(() {
                  _selectedIndex = index; // Update index
                });
                controller.handleLogout(context); // Call logout method
              },
            ),

            // // Navigation Items
            // _buildNavItem(
            //   label: 'Dashboard',
            //   icon: "assets/icons/dashboard.png",
            //   index: 0,
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //
            //     controller.changePage(AppRoutes.dashboard); // or whatever route is appropriate
            //   },
            // ),
            // _buildNavItem(
            //   label: 'Templates',
            //   icon: "assets/icons/templates.png",
            //
            //   index: 1,
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.changePage(AppRoutes.templates); // or whatever route is appropriate
            //
            //   },
            // ),
            // _buildNavItem(
            //   label: 'Collections',
            //   index: 2,
            //   icon: "assets/icons/collections.png",
            //
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.changePage(AppRoutes.collections); // or whatever route is appropriate
            //
            //   },
            // ),
            // _buildNavItem(
            //   label: 'Recent Activity',
            //   index: 3,
            //   icon: "assets/icons/recentactivity.png",
            //
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.changePage(AppRoutes.recentActivity); // or whatever route is appropriate
            //
            //   },
            // ),
            // _buildNavItem(
            //   label: 'Users',
            //   index: 4,
            //   icon: "assets/icons/users.png",
            //
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.changePage(AppRoutes.users); // or whatever route is appropriate
            //
            //   },
            // ),
            // _buildNavItem(
            //   label: 'Orders',
            //   index: 5,
            //   icon: "assets/icons/orders.png",
            //
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.changePage(AppRoutes.orders); // or whatever route is appropriate
            //
            //   },
            // ),
            // _buildNavItem(
            //   label: 'Settings',
            //   index: 6,
            //   icon: "assets/icons/settings.png",
            //
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.changePage(AppRoutes.settings); // or whatever route is appropriate
            //
            //   },
            // ),
            // Spacer(),
            // _buildNavItem(
            //   label: 'Logout',
            //   index: 7,
            //   icon: "assets/icons/logouticon.png",
            //
            //   ontap: (index) {
            //     setState(() {
            //       _selectedIndex = index; // Update index
            //     });
            //     controller.handleLogout; // or whatever route is appropriate
            //
            //   },),
          ],
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
    final bool isSelected = _selectedIndex == index;

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
