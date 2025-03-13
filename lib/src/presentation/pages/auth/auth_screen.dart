import 'package:coloring_app_admin_panel/src/data/datasource/auth/auth_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/auth/auth_repository_implementation.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/auth/auth_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../utils/CustomWidgets/custom_textfields.dart';
import '../../../../utils/app_routes.dart';
import '../../../core/jwt_token_decryption.dart';
import '../../controllers/auth/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  final AuthController _loginController = Get.put(AuthController(AuthUseCase(AuthRepositoryImpl(AuthApiDataImpl()))));

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    String tokenStatus = await JwtHelper.validateToken();

    if (tokenStatus == "Token is valid.") {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();

    super.dispose();
  }

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
                child: Form(
                  key: _formKey,
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
                        controller: _controller1,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter an email';
                          }
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
                        controller: _controller2,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter a password';
                          }
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
                      Obx(() {
                        return _loginController.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    // If the form is valid, trigger the login logic
                                    String email = _controller1.text;
                                    String password = _controller2.text;


                                    _loginController.login(email, password);
                                  }



                                },
                                text: "Login",
                                color: AppColors.brightblue,
                                borderradius: 15,
                                textcolor: AppColors.white,
                                opacity: 1,
                                height: 75,
                                width: 515,
                                fontsize: AppFontSize.titlelarge,
                              );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
