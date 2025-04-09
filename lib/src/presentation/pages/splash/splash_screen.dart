// import 'package:coloring_app_admin_panel/src/presentation/pages/auth/auth_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../constants/color_constants.dart';
// import '../../../core/jwt_token_decryption.dart';
// import '../../../core/token_saving.dart';
// import '../dashboard.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   var sessionManager = SessionManager.instance;
//
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 3), () {
//       Get.offAllNamed('/AuthScreen');    });
//
//     final token = sessionManager.getSession('access_token');
//
//     print(token);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppColors.darkblue,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               "images/background.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                   child: Column(
//                     children: [
//                       Image.asset("icons/png/logo.png"),
//                     ],
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// bool checkUserAuthentication() {
//   jwtTokenDecryption();
//   return false;
// }