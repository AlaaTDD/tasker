import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/models/task_model.dart';
import '../../customs/share_per.dart';
import '../../helper/dio.dart';
import '../../models/user_model.dart';
part 'taskcubit_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskcubitInitial());
  static TaskCubit get(context) => BlocProvider.of(context);
  List<File>file=[];
  Future<UserModel?> getDataoneUser() async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "users", token: token);
    if (response.statusCode == 200) {
      print(response.data);
      return UserModel.fromJson(response.data);
    }
  }
  addPdf()async{
    final result=await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );
    if(result==null) return;
    final path=  result.files.single.path!;
    file.add(File(path));
    emit(addpdf());
  }
  Future AddTask(String title,String description,String employeeId,int Priority,List<File>file,DateTime start,DateTime end,int numofsubtask) async {
    final token=await SharePer.getData("token");
      emit(addtaskload());
      final response =  await DioHelper.PostDataWithpdfs(
          url: "task",
          title:title ,
          numofsubtask:numofsubtask,
          description: description,
          enddateTime: end,
          imagePaths: file,
          employeeId:  employeeId,
          Priority:Priority ,
          startdateTime:start ,
          token: token
      );
      if(response.statusCode==201){
        emit(addtasksucc());
        return response.data;
      }
  }
  Future<TaskModel?> getTask() async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "task", token: token);
    if (response.statusCode == 200) {
      return TaskModel.fromJson(response.data);
    }
  }
  Future<TaskModel?> getAllTask() async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "task/all", token: token);
    if (response.statusCode == 200) {
      return TaskModel.fromJson(response.data);
    }
  }
  int numofsub=0;
  increasenumofsub(){
    numofsub++;
    emit(num());
  }
  removenumofsub(){
   if(numofsub!=0){
     numofsub--;
   }
    emit(num());
  }
  String TimeTask(DateTime start,DateTime end){
    Duration difference = end.difference(start);
    int years = difference.inDays ~/ 365;
    int months = (difference.inDays % 365) ~/ 30;
    int days = difference.inDays % 30;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    if(years!=0){
      return "$years years";
    }else if(months!=0){
      return "$months months";
    }else if(days!=0){
      return "$days days";
    }else if(hours!=0){
      return "${hours}h ${minutes}m";
    }else if(minutes!=0){
      return "${minutes}m ${seconds}s";
    }else if(seconds!=0){
      return "${seconds}s";
    }else{
      return "";
    }
  }
  List<File>file2=[];
  updatePdf()async{
    final result=await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );
    if(result==null) return;
    final path=  result.files.single.path!;
    file2.add(File(path));
    emit(addpdf());
  }
  Future updatedata  (String title,String description,String Id,int Priority,List<File>file,DateTime start,DateTime end) async {
    final token = await SharePer.getData("token");
  await DioHelper.udateDataWithpdfs(
        url: "task/$Id",
        title:title ,
        description: description,
        enddateTime: end,
        imagePaths: file,
        Priority:Priority ,
        startdateTime:start ,
        token: token
    ).then((value)
    {
      emit(udatetasksucc());

    }).catchError((error){
      emit(udatetaskerror());
    });

  }
}
