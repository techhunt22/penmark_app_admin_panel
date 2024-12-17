import 'package:coloring_app_admin_panel/src/presentation/controllers/routes/navigation_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/color_constants.dart';
import 'constants/font_family.dart';

void main() {

  runApp(const MyApp());
  Get.put(NavigationController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.brightblue.withOpacity(0.2),
          cursorColor: AppColors.black,
          selectionHandleColor: AppColors.brightblue, // Color of the selection handles
        ),
        fontFamily: AppFonts.poppins,
        cardColor: AppColors.white,
        useMaterial3: true,
      ),
      home: const MainDashboardScreen(),
    );
  }
}

