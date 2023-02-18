import 'package:flutter/material.dart';

import '../Utils/app_colors/app_colors.dart';

class CustomUpgradeButton extends StatelessWidget {
  Color color;
  VoidCallback ontap;
  String title;
  CustomUpgradeButton(
      {super.key,
      required this.color,
      required this.ontap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: 174,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 14),
        )),
      ),
    );
  }
}
