import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StorageUsege extends StatelessWidget {
  const StorageUsege({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 5,
            ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Image',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '23000 Images',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
