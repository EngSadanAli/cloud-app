import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/app_colors/app_colors.dart';
import '../../widgets/storage_usage.dart';

class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Storage',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: PieChart(PieChartData(
                  centerSpaceRadius: 40,
                  centerSpaceColor: null,
                  borderData: FlBorderData(show: false),
                  sections: [
                    PieChartSectionData(color: Colors.blue),
                    PieChartSectionData(color: Colors.orange),
                    PieChartSectionData(color: Colors.amber),
                    PieChartSectionData(color: Colors.green)
                  ])),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text(
                      'Strage Left',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      '1.4GB',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    const Text(
                      'Strage Left',
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 7.h,
                            color: Colors.red,
                          ),
                          Container(
                            width: 50.w,
                            height: 7.h,
                            color: Colors.amber,
                          ),
                          Container(
                            width: 50.w,
                            height: 7.h,
                            color: Colors.green,
                          ),
                          Container(
                            width: 50.w,
                            height: 7.h,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 50.w,
                            height: 7.h,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 50.w,
                            height: 7.h,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const StorageUsege(),
                    const StorageUsege(),
                    const StorageUsege(),
                    const StorageUsege(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
