import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/bloc/subtask/subtask_cubit.dart';
import 'package:tasker/customs/custom_bottom.dart';
import 'package:tasker/customs/need_bloc.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:tasker/widgets/dot_border.dart';
import 'package:flutter/material.dart';
import '../../customs/constants.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_text_field.dart';
import '../../models/task_model.dart';
import '../../resources/color_management.dart';

class SendTask extends StatelessWidget {
  Datum datum;
  SendTask({super.key,required this.datum});
  TextEditingController note=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubtaskCubit,SubtaskState>(
      builder: (BuildContext context, state) {
      return CustomWidget(
          text:AppStringsDir.DeliveryTask(context),
          widget: Column(
            children: [
              const SizedBox(height: 50,),
              CustomText(width: 335,name: datum.title,alignmentGeometry: Alignment.center, fontWeight: FontWeight.w600,color:ColorManager.blacktowhite(context).withOpacity(0.7), font: 24),
              const SizedBox(height: 50,),
              dotBorderFile(327, 150,() {
               SubtaskCubit.get(context).addPdf();
              },context),
              const SizedBox(height: 50,),
              CustomText(width: 327,name: AppStringsDir.comments(context), fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7), font: 16),
              CustomTextFormFeldnote(controller: note,textInputType: TextInputType.text, ii: 327, isStwich: false,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 5,line: 7,),
              const SizedBox(height: 50,),
              CustomBottonB(name: AppStringsDir.Submitassignment(context), onPressed: (){
               SubtaskCubit.get(context).AddSubTask(
                  datum.managerId,
                   datum.id,
                   AuthCubit.get(context).userData.name.toString(),
                   datum.title,
                   note.text,
                   SubtaskCubit.get(context).file);
              }, height: 58, width: 327,color: ColorManager.greenColor,colorr: ColorManager.whiteColor,),
              const SizedBox(height: 50,),
            ],
          ));
    }, listener: (BuildContext context, Object? state) {
        if(state is addtaskload){
          NeedBloc.showDelogSendTask(context,AppStringsDir.Submitassignment1(context), () {});
        }
        if(state is addtasksucc){
         note.clear();
         SubtaskCubit.get(context).file.clear();
         navigatToback(context);
         navigatToback(context);
        }
    },);
  }
}
