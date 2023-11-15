import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/models/subtask_model.dart';

import '../../customs/share_per.dart';
import '../../helper/dio.dart';

part 'subtask_state.dart';

class SubtaskCubit extends Cubit<SubtaskState> {
  SubtaskCubit() : super(SubtaskInitial());
  static SubtaskCubit get(context) => BlocProvider.of(context);
  List<File>file=[];

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
  Future AddSubTask(String manager_id,String taskid,String ename,String title,String description,List<File>file) async {
    final token=await SharePer.getData("token");
    emit(addtaskload());
    final response =  await DioHelper.PostDataWithSubpdfs(
        url: "subtask",
        title:title ,
        manager_id:manager_id ,
        ename: ename,
        taskid:taskid ,
        description: description,
        imagePaths: file,
        token: token
    );
    if(response.statusCode==201){
      emit(addtasksucc());
      return response.data;
    }
  }
  Future<SubtaskModel?> getTask() async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "subtask", token: token);
    if (response.statusCode == 200) {
      return SubtaskModel.fromJson(response.data);
    }
  }
  Future<SubtaskModel?> getTaskAdmin(String Id) async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "task/$Id/subtask/admin", token: token);
    if (response.statusCode == 200) {
      return SubtaskModel.fromJson(response.data);
    }
  }
  Future<SubtaskModel?> getSubTaskByTaskid(String Id) async {
    final token = await SharePer.getData("token");
    final response = await DioHelper.getData(url: "task/$Id/subtask", token: token);
    if (response.statusCode == 200) {
      return SubtaskModel.fromJson(response.data);
    }
  }
  Future updatedata(String Id,String action_name,List<String> dec) async {
    if(action_name=="approve"){
      emit(updatetaskload());
    }
    final token = await SharePer.getData("token");
    await DioHelper.updateData(
        url: "subtask/$Id",
        data: {
          "action_name":action_name,
          "description":dec
        }, token:token ).then((value)
    {
      print(value.data);
      if(action_name=="approve"){
        emit(updatetasksucc());
      }else{
        emit(updatetasksucc2());
      }

    }).catchError((error){
      emit(updatetaskerror());
    });

  }
}
