import 'package:coloring_app_admin_panel/src/presentation/pages/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color_constants.dart';
import '../controllers/routes/navigation_controller.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    // Create a GlobalKey for the Scaffold
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, // Assign the GlobalKey to the Scaffold
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 1085,
                    child: SingleChildScrollView(child: const NavigationSidebar()),
                  ),
                  Obx(() {
                    return SizedBox(
                      width: 1620,

                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,

                        child: SingleChildScrollView(
                          child: controller.getContentWidget(controller.currentRoute),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }


}

