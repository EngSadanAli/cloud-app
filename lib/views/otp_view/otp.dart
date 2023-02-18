import 'package:cloud_project/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';

import '../../Utils/app_colors/app_colors.dart';
import '../../Utils/app_images/app_images.dart';
import '../../widgets/custom_otp.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custome_button.dart';

import '../forgot_password_view/forgot_password.dart';
import '../home_view/home_view.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _LoginViewState();
}

class _LoginViewState extends State<OTPView> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color(0xfff14FFFFFF),
        borderColor = Color.fromARGB(71, 33, 149, 243);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
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
                        'Forgot Password!',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const Text(
                        'Enter OTP, we have send it to your Email you entered',
                        style: TextStyle(fontSize: 12, color: Colors.white54),
                      ),

                      SizedBox(
                        height: 50.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 23),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Enter OTP')),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      //OTP tEXTFIELD
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Directionality(
                              // Specify direction if desired
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                controller: pinController,
                                focusNode: focusNode,
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                defaultPinTheme: defaultPinTheme,
                                validator: (value) {
                                  return value == '2222'
                                      ? null
                                      : 'Pin is incorrect';
                                },
                                // onClipboardFound: (value) {
                                //   debugPrint('onClipboardFound: $value');
                                //   pinController.setText(value);
                                // },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  debugPrint('onCompleted: $pin');
                                },
                                onChanged: (value) {
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: focusedBorderColor,
                                    ),
                                  ],
                                ),
                                focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    color: fillColor,
                                    borderRadius: BorderRadius.circular(19),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      CustomButton(
                        text: 'RESET',
                        onPressed: () {
                          focusNode.unfocus();
                          if (formKey.currentState!.validate())
                            Get.to(() => const HomeView());
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Remembered Password? '),
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
