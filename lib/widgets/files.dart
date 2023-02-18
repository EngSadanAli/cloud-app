import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_images/app_images.dart';
import '../views/files_view/files_view.dart';

class Files extends StatelessWidget {
  const Files({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FilesView(
              title: 'UI Designs',
              time: '8:24 PM',
              image: Image.asset(AppImages.folder3),
              color: Color.fromARGB(255, 202, 235, 247),
            ),
            FilesView(
              title: 'UI Designs',
              time: '8:24 PM',
              image: Image.asset(AppImages.folder2),
              color: Color.fromARGB(255, 204, 220, 252),
            ),
            FilesView(
              title: 'UI Designs',
              time: '8:24 PM',
              image: Image.asset(AppImages.folder1),
              color: Color(0xffFAF3E5),
            ),
          ],
        ),
      ),
    );
  }
}
