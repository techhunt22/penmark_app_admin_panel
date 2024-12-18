import 'package:coloring_app_admin_panel/src/presentation/pages/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/color_constants.dart';
import '../../core/responsive_layout/responsive_widget.dart';
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
      endDrawer: NavigationSidebar(isSidebaron: false), // Add the drawer
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
            child: ResponsiveLayout(
              mobile: mobTabletWidget(controller, scaffoldKey), // Pass scaffoldKey here
              tablet: mobTabletWidget(controller, scaffoldKey),
              laptop: webLaptopWidget(controller),
              web: webLaptopWidget(controller),
            ),
          ),
        ],
      ),
    );
  }


}
Widget webLaptopWidget(NavigationController controller) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const NavigationSidebar(isSidebaron: true),
      Obx(() {
        return Expanded(
          child: SingleChildScrollView(
            child: controller.getContentWidget(controller.currentRoute),
          ),
        );
      }),
    ],
  );
}

Widget mobTabletWidget(NavigationController controller, GlobalKey<ScaffoldState> scaffoldKey) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      // Use the passed scaffoldKey to open the drawer
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  );
                },
              ),
            ],
          ),
        ),

        Obx(() {
          return controller.getContentWidget(controller.currentRoute);
        }),
      ],
    ),
  );
}