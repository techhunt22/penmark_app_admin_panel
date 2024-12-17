import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../utils/CustomWidgets/custom_textfields.dart';
import '../dashboard.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkblue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "images/background.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: height2),

                    // Logo
                    Image.asset("icons/png/logo.png"),

                    const SizedBox(height: gap4),

                    // Email/Phone TextField
                    CustomTextField(
                      controller: _controller,
                      validator: (p0) {
                        return null;
                      },
                      icon: SvgPicture.asset(
                        "icons/svg/mail.svg",
                        height: 15,
                        width: 19,
                        fit: BoxFit.scaleDown,
                      ),
                      hinttext: "Email or phone number",
                      title: "Email/Number",
                      titleon: true,
                    ),

                    const SizedBox(height: gap),

                    // Password TextField
                    CustomPasswordField(
                      controller: _controller,
                      validator: (p0) {
                        return null;
                      },
                      title: "Password",
                      hinttext: "************",
                      titleon: true,
                      icon: SvgPicture.asset(
                        "icons/svg/lock.svg",
                        height: 18,
                        width: 19,
                        fit: BoxFit.scaleDown,
                      ),
                    ),

                    const SizedBox(height: gap3),

                    // Login Button
                    CustomButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("pressed get submitted");
                        }

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainDashboardScreen(),
                            ));
                      },
                      text: "Login",
                      color: AppColors.brightblue,
                      borderradius: 15,
                      textcolor: AppColors.white,
                      opacity: 1,
                      height: 75,
                      width: 515,
                      fontsize: AppFontSize.titlelarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
