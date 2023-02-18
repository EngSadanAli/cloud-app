import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors/app_colors.dart';
import '../Utils/app_images/app_images.dart';
import 'cutom_upgrade_button.dart';

class UpgradeCard extends StatefulWidget {
  const UpgradeCard({super.key});

  @override
  State<UpgradeCard> createState() => _UpgradeAccountState();
}

class _UpgradeAccountState extends State<UpgradeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(children: [
          Image.asset(
            AppImages.upgrade1,
            height: 242,
            width: 247,
          ),
          Text(
            '15GB',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'Basic - A stater plan for everyone',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black38,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'RS',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'per month',
            style: TextStyle(
                fontSize: 12,
                color: Colors.black38,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.backGroundColor,
                  radius: 3,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Monthly Disccount',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.backGroundColor,
                  radius: 3,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Unlimited Orders',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.backGroundColor,
                  radius: 3,
                ),
                SizedBox(
                  width: 10.w,
                ),
              const  Text(
                  'Free & Fast Delivery',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          CustomUpgradeButton(
            color: Colors.grey,
            ontap: () {},
            title: 'Your Cuttent Plan',
          )
        ]),
      ),
    );
  }
}
