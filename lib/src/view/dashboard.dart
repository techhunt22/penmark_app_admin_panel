import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/src/viewmodel/routes/dashboard_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sidebar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();


    return Scaffold(
      backgroundColor: AppColors.white2,
      body: Stack(
        fit: StackFit.expand,
        children: [

          Positioned.fill(
            child: Image.asset(
              "images/background2.png",
              fit: BoxFit.cover,
            ),
          ),

           SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar
                const NavigationSidebar(),
                // Main Content
                Obx(() {
                  return  Expanded(
                    child: SingleChildScrollView(
                      child: controller.getContentWidget(controller.currentRoute),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







