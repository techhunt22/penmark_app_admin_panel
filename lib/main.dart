import 'package:coloring_app_admin_panel/src/core/binding.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/auth/auth_screen.dart';
import 'package:coloring_app_admin_panel/src/presentation/pages/dashboard.dart';
import 'package:coloring_app_admin_panel/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/color_constants.dart';
import 'constants/font_family.dart';


void main() {


  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Penmark',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: AppColors.white),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.brightblue.withValues(alpha:0.2),
          cursorColor: AppColors.black,
          selectionHandleColor:
              AppColors.brightblue, // Color of the selection handles
        ),
        fontFamily: AppFonts.poppins,
        cardColor: AppColors.white,
        useMaterial3: true,
      ),
      initialBinding: InitialBinding(),

      initialRoute: AppRoutes.auth, // Make sure the initial route is correct
      getPages: [
        GetPage(name: AppRoutes.auth, page: () => AuthScreen()),
        GetPage(name: AppRoutes.dashboard, page: () => MainDashboardScreen()), // Add this route
        // Add other routes here as needed
      ],
    );
  }
}
