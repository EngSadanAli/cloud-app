import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../Utils/app_colors/app_colors.dart';
import '../../widgets/cutom_upgrade_button.dart';
import '../../widgets/upgrade_account_card.dart';

class UpgradeAccount extends StatelessWidget {
  const UpgradeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Upgrade Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomUpgradeButton(
                    color: AppColors.backGroundColor,
                    ontap: () => {},
                    title: 'Monthly',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomUpgradeButton(
                    color: Colors.grey,
                    ontap: () => {},
                    title: 'Yearly',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const UpgradeCard(),
            const UpgradeCard(),
            const UpgradeCard(),
          ]),
        ),
      ),
    );
  }
}
