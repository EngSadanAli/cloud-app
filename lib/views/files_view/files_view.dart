import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/app_images/app_images.dart';

class FilesView extends StatelessWidget {
  String title;
  String time;
  Image image;
  Color color;
  FilesView(
      {super.key,
      required this.image,
      required this.title,
      required this.time,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: Container(
          width: 130.w,
          height: 175.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      time,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black38),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
