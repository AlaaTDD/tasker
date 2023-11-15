import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tasker/resources/string_manager.dart';
class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "${AppStringsDir.urlbase}/",
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": true,
        "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      },
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response> postData1(
      {required String url,
      required Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {"Content-Type": "application/json"};
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic>? data,
      Map<String, dynamic>? query,
      required String token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> SignupWithImage(
      {required String url,
        required Map<String, dynamic>? data,
        Map<String, dynamic>? query}) async {
    dio.options.headers = {"Content-Type": "application/json"};
    return await dio.post(url, data: data, queryParameters: query);
  }
  static Future<Response> addPDFData(
      {required String url,
        required String name,
        required File file,
        required String token}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": name,
      "link": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType:new MediaType("application", "pdf"),
      ),
    });
    return await dio.post(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }

  static Future<Response> PostDataWithImage(
      {required String url,
        required String token,
        required FormData formData,
      }) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    return await dio.post(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
  static Future<Response> PostDataWithImageCategory(
      {required String url,
        required String name,
        required String token,
        required File file}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": name,
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType:new MediaType("image", "jpeg"),
      ),
    });
    return await dio.post(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
  static Future<Response> PostDataWithImageLocation(
      {required String url,
        required String name,
        required String lat,
        required String long,
        required String longname,
        required String token,
        required File file}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": name,
      "lat":lat,
      "long": long,
      "longname":longname,
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType:new MediaType("image", "jpeg"),
      ),
    });
    return await dio.post(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
  static Future<Response> PostDataWithpdfs(
      {required String url,
        required String title,
        required String employeeId,
        required DateTime startdateTime,
        required DateTime enddateTime,
        required int Priority,
        required int  numofsubtask,
        required String description,
        required String token,
        required List<File> imagePaths,}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    FormData formData = FormData();
    formData = FormData.fromMap({
      "title": title,
      "employee_id":employeeId,
      "numofsubtask":numofsubtask,
      "start_date":startdateTime,
      "due_date": enddateTime,
      "Priority":Priority,
      "description":description,
    });
    for (File path in imagePaths) {
        String fileName = path.path.split('/').last;
        formData.files.add(
          MapEntry(
            'file_upload',
            await MultipartFile.fromFile(
               path.path,
              filename: fileName,
              contentType:new MediaType("application", "pdf"),),
          ),
        );
    }
    return await dio.post(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
  static Future<Response> PostDataWithSubpdfs(
      {required String url,
        required String title,
        required String taskid,
        required String ename,
        required String manager_id,
        required String description,
        required String token,
        required List<File> imagePaths,}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    FormData formData = FormData();
    formData = FormData.fromMap({
      "task_id":taskid,
      "title": title,
      "manager_id":manager_id,
      'e_name':ename,
      "description":description,
    });
    for (File path in imagePaths) {
      String fileName = path.path.split('/').last;
      formData.files.add(
        MapEntry(
          'file_upload',
          await MultipartFile.fromFile(
            path.path,
            filename: fileName,
            contentType:new MediaType("application", "pdf"),),
        ),
      );
    }
    return await dio.post(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
  static Future<Response> changeImage(
      {required String url,
        required File file,
        required String token}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType:new MediaType("image", "jpeg"),
      ),
    });
    return await dio.put(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      required String token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> getData1(
      {required String url, Map<String, dynamic>? query}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData(
      {required String url, required String token}) async {
    dio.options.headers = {
     "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    return await dio.delete(url);
  }

  static Future<Response> deleteData1(
      {required String url,
      required Map<String, dynamic>? data,
      required String token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    return await dio.delete(url, data: data);
  }

  static Future<Response> updateData(
      {required String url,
      required Map<String, dynamic>? data,
      Map<String, dynamic>? query,
      required String token}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    return await dio.put(url, data: data);
  }
  static Future<Response> udateDataWithpdfs(
      {required String url,
        required String title,
        required DateTime startdateTime,
        required DateTime enddateTime,
        required int Priority,
        required String description,
        required String token,
        required List<File> imagePaths,}) async {
    dio.options.headers = {
      "accept":"*/*",
      "Authorization": "Bearer $token",
      "Content-Type": "multipart/form-data",
    };
    FormData formData = FormData();
    formData = FormData.fromMap({
      "title": title,
      "start_date":startdateTime,
      "due_date": enddateTime,
      "Priority":Priority,
      "description":description,
    });
    for (File path in imagePaths) {
      String fileName = path.path.split('/').last;
      formData.files.add(
        MapEntry(
          'file_upload',
          await MultipartFile.fromFile(
            path.path,
            filename: fileName,
            contentType:new MediaType("application", "pdf"),),
        ),
      );
    }
    return await dio.put(
      url,
      data: formData,
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        headers: {
          "accept":"*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
  }
  static Future<Response> updateData1(
      {required String url,
        required Map<String, dynamic>? data,
        Map<String, dynamic>? query,}) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.put(url, data: data);
  }
}
