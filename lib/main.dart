import 'package:coloring_app_admin_panel/src/view/dashboard.dart';
import 'package:coloring_app_admin_panel/src/viewmodel/routes/dashboard_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/color_constants.dart';
import 'constants/font_family.dart';

void main() {

  runApp(const MyApp());
  Get.put(DashboardController());
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
        fontFamily: AppFonts.poppins,
        cardColor: AppColors.white,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

