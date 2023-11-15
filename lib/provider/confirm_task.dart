
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Confirm extends ChangeNotifier{
  double progres=0;
  int index=0;
  changeIndex(int index){
    this.index=index;
    notifyListeners();
  }
   Future<void> downloadFile(String url) async {
    Dio dio = Dio();
    try {
      // Request permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        final myImagePath = await getDownloadPath();
        await dio.download(url, myImagePath,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                double progress = double.parse(((received / total) * 100).toStringAsFixed(0))/100;
                print(progress);
                progres=progress;
                notifyListeners();
              }
            });
        print("File downloaded to: $myImagePath");
        progres=0;
      } else {
        // Permission denied
        print("Permission denied to access storage");
      }
    } catch (e) {
      print("Error downloading file: $e");
      progres=0;
    }
  }

   Future<String> getDownloadPath() async {
    final Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      final myImagePath = '${directory.path}/Alaaaaaaaaa';
      final imageFolder = Directory(myImagePath);
      // Ensure the directory exists
      if (!imageFolder.existsSync()) {
        imageFolder.createSync(recursive: true);
      }
      return '$myImagePath/alaaaaaaaaa.pdf';
    } else {
      throw "Error getting external storage directory";
    }
  }
}