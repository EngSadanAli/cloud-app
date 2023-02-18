import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/app_colors/app_colors.dart';
import '../../Utils/app_images/app_images.dart';
import '../onboarding_view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Image.asset(AppImages.splashcircle)],
              ),
            ),
            Center(
              child: SizedBox(
                  height: 157.h,
                  width: 147.w,
                  child: Image.asset(AppImages.logo)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(AppImages.splashBottomImage),
            )
          ],
        ));
  }
}
