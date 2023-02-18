import 'package:flutter/material.dart';

class PickedFile extends StatelessWidget {
  String? directoryPath;
  PickedFile({super.key, required this.directoryPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        directoryPath.toString(),
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
