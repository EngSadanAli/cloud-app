import 'package:cloud_project/Utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CusotmTextField extends StatelessWidget {
  Widget widget;
  String text;
  CusotmTextField({super.key, required this.widget, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xfff14FFFFFF),
          border: Border.all(color: AppColors.backGroundColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: widget,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      hintText: text,
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(10))),
            ),
          )
        ],
      ),
    );
  }
}
