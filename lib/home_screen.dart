import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? directoryPath;
  String? fileName = '';
  List<PlatformFile>? cvFilePath;
  void pickFilesFromDrive() async {
    try {
      directoryPath = null;
      cvFilePath = (await FilePicker.platform.pickFiles(
        // type: FileType.custom,
        allowMultiple: true,
        onFileLoading: (FilePickerStatus status) {
        } ,
        // allowedExtensions: ['jpg', 'pdf', 'doc'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("this is platform exception ${e.toString()}");
      // AppConstant.flutterToastError(responseMessage: e.toString());
    } catch (e) {
      print("this is cathc error ${e.toString()}");
      // AppConstant.flutterToastError(responseMessage: e.toString());
    }
    if (!mounted) return;
    setState(() {
      fileName = cvFilePath != null
          ? cvFilePath!.map((e) => e.name).toString()
          : '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    pickFilesFromDrive();
                    print("this is lockfile ");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.height*0.1,
                    child: Center(
                      child: Text(fileName!+"Upload file",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cvFilePath == null ? 0 :cvFilePath!.length,
                  itemBuilder: (ctx, index){
                return cvFilePath == null ? Text(""): Container(
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Image.file(
                    File(cvFilePath![index].path!),
                    // height: cvFilePath,
                    fit: BoxFit.cover,
                    // width: 45.0,
                  ),
                );
              })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
