import 'package:coloring_app_admin_panel/constants/color_constants.dart';
import 'package:coloring_app_admin_panel/src/core/responsive_layout/responsive_widget.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/sidebar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/routes/navigation_controller.dart';



class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobile: MainScreenMobTabWidget(),
        tablet: MainScreenMobTabWidget(),
        laptop: MainScreenWebLaptWidget(),
        web: MainScreenWebLaptWidget()
    );
  }
}





class MainScreenWebLaptWidget extends StatelessWidget {
  const MainScreenWebLaptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();


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
                const NavigationSidebar(
                  isSidebaron: true,
                ),
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

class MainScreenMobTabWidget extends StatelessWidget {
  const MainScreenMobTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();


    return Scaffold(
      backgroundColor: AppColors.white2,
      endDrawer: const NavigationSidebar(
        isSidebaron: false,
      ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Image.asset("icons/png/logo2.png"),

                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: SvgPicture.asset("icons/svg/menu.svg"),
                            onPressed: () {
                              // Open the drawer
                              Scaffold.of(context).openEndDrawer();

                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

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






