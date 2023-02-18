import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Utils/app_colors/app_colors.dart';
import '../Utils/app_images/app_images.dart';
import '../views/storage_view/storage_view.dart';

class StorageSection extends StatelessWidget {
  const StorageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(StorageView()),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: AppColors.backGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 55.h,
                    width: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(AppImages.bluelogo),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Free Storage',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '13.6GB/15GB',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 5.0,
                  animationDuration: 2500,
                  percent: 0.8,
                  // center: Text("80.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
