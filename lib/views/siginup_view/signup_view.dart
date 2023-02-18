import 'package:cloud_project/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/app_colors/app_colors.dart';
import '../../Utils/app_images/app_images.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custome_button.dart';
import '../forgot_password_view/forgot_password.dart';

class SiginUpView extends StatefulWidget {
  const SiginUpView({super.key});

  @override
  State<SiginUpView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SiginUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: SizedBox(
                            height: 137.h,
                            width: 186.w,
                            child: Image.asset(AppImages.loginLogo),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text(
                        'SIGN UP!',
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
                        height: 40.h,
                      ),
                      //Username Textfield
                      CusotmTextField(
                        widget: const Icon(
                          Icons.person_2_outlined,
                        ),
                        text: 'User Name',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //EMAIL tEXTFIELD
                      CusotmTextField(
                        widget: const Icon(
                          Icons.email_outlined,
                        ),
                        text: 'Email',
                      ),
                      SizedBox(
                        height: 20.h,
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
                          text: 'SIGN UP',
                          onPressed: () {
                            Get.to(() => const LoginView());
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account? '),
                          GestureDetector(
                            onTap: () => Get.to(() => const LoginView()),
                            child: const Text(
                              'Login Now',
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Positioned(
                bottom: 0, left: 0, child: Image.asset(AppImages.signupbottom))
          ],
        ),
      ),
    );
  }
}
