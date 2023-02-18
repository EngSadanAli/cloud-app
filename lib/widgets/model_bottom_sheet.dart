import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/app_colors/app_colors.dart';
import '../home_screen.dart';
import 'PickedFile.dart';

class ModelBottomSheet extends StatefulWidget {
  const ModelBottomSheet({super.key});

  @override
  State<ModelBottomSheet> createState() => _ModelBottomSheetState();
}

class _ModelBottomSheetState extends State<ModelBottomSheet> {
  String? directoryPath;
  String? fileName = '';
  List<PlatformFile>? cvFilePath;
  void pickFilesFromDrive() async {
    try {
      directoryPath = null;
      cvFilePath = (await FilePicker.platform.pickFiles(
        // type: FileType.custom,
        allowMultiple: true,
        onFileLoading: (FilePickerStatus status) {},
        // allowedExtensions: ['jpg', 'pdf', 'doc'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      Get.to(const HomeScreen());
      print("this is platform exception ${e.toString()}");
      // AppConstant.flutterToastError(responseMessage: e.toString());
    } catch (e) {
      print("this is cathc error ${e.toString()}");
      // AppConstant.flutterToastError(responseMessage: e.toString());
    }
    if (!mounted) return;
    setState(() {
      fileName =
          cvFilePath != null ? cvFilePath!.map((e) => e.name).toString() : '';
      Get.to(PickedFile(
        directoryPath: fileName,
      ));
    });
  }

  String _scanBarcode = 'Unknown';
  String get scanBarcode => _scanBarcode;
  String _scanBarcodeTime = 'Unknown';
  String get scanBarcodeTime => _scanBarcodeTime;
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    _scanBarcode = barcodeScanRes;
    _scanBarcodeTime = barcodeScanRes.isDateTime
        ? barcodeScanRes.isDateTime.toString()
        : "No date-time value found in the barcode";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickFilesFromDrive();
                        },
                        child: Container(
                          height: 65.h,
                          width: 65.h,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(34, 67, 111, 233)),
                          child: Icon(
                            Icons.folder,
                            size: 40,
                            color: AppColors.backGroundColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Folder',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickFilesFromDrive();
                        },
                        child: Container(
                          height: 65.h,
                          width: 65.h,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(34, 67, 111, 233)),
                          child: Icon(
                            Icons.file_copy,
                            size: 40,
                            color: AppColors.backGroundColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'File',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      String barcodeScanRes =
                          await FlutterBarcodeScanner.scanBarcode(
                              '#ff6666', 'Cancel', true, ScanMode.QR);
                      setState(() {
                        _scanBarcode = barcodeScanRes;
                      });
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Scan Result'),
                            content: Text(
                              _scanBarcode,
                              style: TextStyle(color: Colors.black),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 65.h,
                      width: 65.h,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromARGB(34, 67, 111, 233),
                      ),
                      child: Icon(
                        Icons.qr_code_scanner_outlined,
                        size: 40,
                        color: AppColors.backGroundColor,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickFilesFromDrive();
                        },
                        child: Container(
                          height: 65.h,
                          width: 65.h,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(34, 67, 111, 233)),
                          child: Icon(
                            Icons.image,
                            size: 40,
                            color: AppColors.backGroundColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text(
                        'Gallery',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                ],
              )),
        )
      ],
    );
  }
}
