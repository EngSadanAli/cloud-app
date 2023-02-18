import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors/app_colors.dart';


class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: AppColors.backGroundColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
