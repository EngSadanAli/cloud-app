import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/app_colors/app_colors.dart';
import '../../widgets/search_field.dart';
import '../my_files/model/controler.dart';
import '../my_files/my_file_gridview.dart';
import '../my_files/my_file_listview.dart';

class RecentView extends StatefulWidget {
  const RecentView({super.key});

  @override
  State<RecentView> createState() => _RecentViewState();
}

class _RecentViewState extends State<RecentView> {
  bool Grid = true;

  final _FilesController = FilesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  child: const Icon(Icons.menu, color: Colors.black),
                  onTap: () {},
                ),
                const Text(
                  'Cloud-Tribe',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromARGB(255, 25, 201, 192),
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const SearchField(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Files',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          Grid = !Grid;
                        });
                      },
                      icon: Grid
                          ? const Icon(Icons.grid_view_outlined)
                          : const Icon(Icons.menu)),
                ],
              ),
            ),
            Grid
                ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _FilesController.model.length,
                        itemBuilder: (context, index) {
                          return MyFileListView(
                            title:
                                _FilesController.model[index].title.toString(),
                            time: _FilesController.model[index].time.toString(),
                            icon: _FilesController.model[index].icon,
                          );
                        }),
                  )
                : Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        children: List.generate(_FilesController.model.length,
                            (index) {
                          return MyFileGridViw(
                            title:
                                _FilesController.model[index].title.toString(),
                            time: _FilesController.model[index].time.toString(),
                            icon: _FilesController.model[index].icon,
                          );
                        })),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backGroundColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
