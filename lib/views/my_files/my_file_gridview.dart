import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyFileGridViw extends StatelessWidget {
  String title;
  String time;
  Icon icon;
  MyFileGridViw(
      {super.key, required this.title, required this.time, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 202, 235, 247),
                borderRadius: BorderRadius.circular(15),
              ),
              child: icon,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
