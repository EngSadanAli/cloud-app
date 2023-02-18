import 'package:cloud_project/home_screen.dart';
import 'package:cloud_project/views/forgot_password_view/forgot_password.dart';
import 'package:cloud_project/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utils/app_colors/app_colors.dart';
import '../../Utils/app_images/app_images.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custome_button.dart';
import '../siginup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: SizedBox(
                            height: 157.h,
                            width: 186.w,
                            child: Image.asset(AppImages.loginLogo),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const Text(
                        'Login to your account',
                        style: TextStyle(fontSize: 12, color: Colors.white54),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      //Username Textfield
                      CusotmTextField(
                        widget: const Icon(
                          Icons.person_2_outlined,
                        ),
                        text: 'User Name',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      //Password Textfield
                      CusotmTextField(
                        widget: const Icon(
                          Icons.lock_outline_sharp,
                        ),
                        text: 'Password',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      GestureDetector(
                        onTap: () => Get.to(() => const ForgotPasswordView()),
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password?')),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButton(
                          text: 'LOGIN',
                          onPressed: () {
                            Get.to(() => const HomeView());
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not have an Account? '),
                          GestureDetector(
                            onTap: () => Get.to(() => const SiginUpView()),
                            child: const Text(
                              'SiginUp Now',
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Positioned(
                bottom: 0, right: 0, child: Image.asset(AppImages.loginbotm))
          ],
        ),
      ),
    );
  }
}
