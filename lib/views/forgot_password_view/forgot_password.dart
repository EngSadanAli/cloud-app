import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/app_colors/app_colors.dart';
import '../../Utils/app_images/app_images.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custome_button.dart';
import '../otp_view/otp.dart';
import '../siginup_view/signup_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _LoginViewState();
}

class _LoginViewState extends State<ForgotPasswordView> {
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
                        'Forgot Password!',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const Text(
                        'Provide your email & we will send you link to reset password',
                        style: TextStyle(fontSize: 12, color: Colors.white54),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      //Username Textfield
                      CusotmTextField(
                        widget: const Icon(
                          Icons.email_outlined,
                        ),
                        text: 'Email',
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      CustomButton(
                          text: 'Send OTP',
                          onPressed: () {
                            Get.to(() => OTPView());
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Remembered Password? '),
                          GestureDetector(
                            onTap: () => Get.to(() => const SiginUpView()),
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
                bottom: 0, right: 0, child: Image.asset(AppImages.loginbotm))
          ],
        ),
      ),
    );
  }
}
