import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: const TextField(
          decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        hintText: 'Search Here',
        hintStyle: TextStyle(color: Colors.black38),
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.all(10),
        fillColor: Color(0xfffF3F4FB),
        filled: true,
      )),
    );
  }
}
