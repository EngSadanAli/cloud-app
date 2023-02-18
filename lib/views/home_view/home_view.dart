import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../Utils/app_colors/app_colors.dart';
import '../../Utils/app_images/app_images.dart';

import '../../widgets/files.dart';
import '../../widgets/model_bottom_sheet.dart';
import '../../widgets/search_field.dart';
import '../../widgets/storage_secation.dart';
import '../files_view/files_view.dart';
import '../my_files/model/controler.dart';
import '../my_files/my_file_gridview.dart';
import '../my_files/my_file_listview.dart';
import '../recent_view/recenet_view.dart';
import '../storage_view/storage_view.dart';
import '../upgrade_account/upgrade_account.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HiddenDrawerNavState createState() => _HiddenDrawerNavState();
}

class _HiddenDrawerNavState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _FilesController = FilesController();
  bool Grid = true;
  bool GridSize = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: Image.asset(AppImages.profile),
                ),
                const Text(
                  'Nouman Khan',
                  style: TextStyle(fontSize: 14),
                ),
                const Text('@gmail.com', style: TextStyle(fontSize: 12)),
                const SizedBox(
                  height: 30,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.folder,
                    color: Colors.white,
                  ),
                  title: Text('My Drive'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  title: Text('Shared with me'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const RecentView());
                  },
                  leading: const Icon(
                    Icons.watch_later,
                    color: Colors.white,
                  ),
                  title: Text('Recent'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text('Bin'),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text('My Drive'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.memory, color: Colors.white),
                    SizedBox(width: 20.w),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const StorageView());
                        },
                        child: const Text('Storage')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 140, bottom: 5),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 3.0,
                    animationDuration: 2500,
                    percent: 0.8,
                    // center: Text("80.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.white,
                  ),
                ),
                const Text(
                  '13.6GB/15GB',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => const UpgradeAccount()),
                  child: Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                      'Upgrade',
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth!,
        right: isCollapsed ? 0 : -0.2 * screenWidth!,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            elevation: 8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              child:
                                  const Icon(Icons.menu, color: Colors.black),
                              onTap: () {
                                setState(() {
                                  if (isCollapsed) {
                                    _controller.forward();
                                  } else {
                                    _controller.reverse();
                                  }

                                  isCollapsed = !isCollapsed;
                                  GridSize = !GridSize;
                                });
                              },
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
                              backgroundColor:
                                  Color.fromARGB(255, 25, 201, 192),
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const SearchField(),
                        const SizedBox(
                          height: 10,
                        ),
                        // Storage Section
                        const StorageSection(),

                        const Text(
                          'Files',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Text(
                          'Last modified',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        const Files(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'My Files',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Text(
                                    'Shared',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 14),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Grid = !Grid;
                                    });
                                  },
                                  icon: Grid
                                      ? const Icon(Icons.grid_view_outlined)
                                      : const Icon(Icons.menu))
                            ],
                          ),
                        ),
                        Grid
                            ? SizedBox(
                                height: 400.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: _FilesController.model.length,
                                    itemBuilder: (context, index) {
                                      return MyFileListView(
                                        title: _FilesController
                                            .model[index].title
                                            .toString(),
                                        time: _FilesController.model[index].time
                                            .toString(),
                                        icon:
                                            _FilesController.model[index].icon,
                                      );
                                    }),
                              )
                            : SizedBox(
                                height: 400.h,
                                child: GridView.count(
                                    crossAxisCount: GridSize ? 2 : 1,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 8.0,
                                    children: List.generate(
                                        _FilesController.model.length, (index) {
                                      return MyFileGridViw(
                                        title: _FilesController
                                            .model[index].title
                                            .toString(),
                                        time: _FilesController.model[index].time
                                            .toString(),
                                        icon:
                                            _FilesController.model[index].icon,
                                      );
                                    })),
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const ModelBottomSheet();
                              });
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.backGroundColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
