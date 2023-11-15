import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileHelper{

 static Future<String> getFileSizeFromLink(String fileLink) async {
   try {
     Dio dio = Dio();
     Response response = await dio.head(fileLink);
     if (response.statusCode == 200) {
       int fileSizeInBytes = int.parse(response.headers.map['content-length']![0]);
       String formattedSize = getFileSizeFormatted(fileSizeInBytes);
       print(formattedSize);
       return formattedSize;
     } else {
       return "";
     }
   } catch (e) {
     return "";
   }
 }

 static String getFileSizeFormatted(int bytes) {
   if (bytes < 1024) {
     return "$bytes B";
   } else if (bytes < 1024 * 1024) {
     return "${(bytes / 1024).toStringAsFixed(2)} KB";
   } else {
     return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";
   }
 }



}