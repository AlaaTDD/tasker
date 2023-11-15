import 'dart:async';

import 'package:awesome_number_picker/awesome_number_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_bottom.dart';
import 'package:tasker/customs/custom_text_field.dart';
import 'package:tasker/customs/menu_custom.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../customs/custom_text.dart';
import '../../customs/need_bloc.dart';
import '../../provider/choise_task_mode.dart';
import '../../provider/menu_mode.dart';
import '../../provider/time_picker_mode.dart';
import '../../resources/color_management.dart';
import '../../widgets/dot_border.dart';
import '../../widgets/time_widget.dart';


class AddTaskes extends StatelessWidget {
   AddTaskes({super.key});
   TextEditingController title=TextEditingController();
   TextEditingController desc=TextEditingController();
   GlobalKey<FormState>globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<TaskCubit,TaskState>(
     builder: (BuildContext context, state) {
     return CustomWidget(
         text: AppStringsDir.add(context),
         widget: Form(
            key: globalKey,
           child: Column(
       children: [
           const SizedBox(height: 40),
           CustomText(
               width: 335,
               name: AppStringsDir.Tasktitle(context),
               alignmentGeometry: AppStringsDir.rtl(context),
               color: ColorManager.blacktowhite(context),
               fontWeight: FontWeight.w600,
               font: 14),
           CustomTextFormFeldnote(
             line: 1,
             controller: title,
             textInputType: TextInputType.text,
             ii: 335,
             isStwich: false,
             i: 5,
             colorr: ColorManager.blackColor,
             color: ColorManager.blackColor,),
           const SizedBox(height: 40),
           CustomText(
               width: 335,
               name: AppStringsDir.SelectManagerEmployee(context),
               alignmentGeometry: AppStringsDir.rtl(context),
               color: ColorManager.blacktowhite(context),
               fontWeight: FontWeight.w600,
               font: 14),
           MenuCustom(),
           const SizedBox(height: 30),
           BuildTime(context),
           const SizedBox(height: 30),
           CustomText(
               width: 335,
               name: AppStringsDir.Taskpriority(context),
               alignmentGeometry: AppStringsDir.rtl(context),
               color:ColorManager.blacktowhite(context),
               fontWeight: FontWeight.w600,
               font: 14),
           Container(
             width: 335,
             child: Row(
               children: [
                 rideoBottom(3,AppStringsDir.High(context),context),
                 rideoBottom(2,AppStringsDir.middle(context),context),
                 rideoBottom(1,AppStringsDir.Low(context),context),
               ],
             ),
           ),
         CustomText(
             width: 335,
             name: AppStringsDir.numofsubtask(context),
             alignmentGeometry: AppStringsDir.rtl(context),
             color:ColorManager.blacktowhite(context),
             fontWeight: FontWeight.w600,
             font: 14),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
             child: Container(
               width: 335,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   buildAddRem(Icons.remove,() {
                    TaskCubit.get(context).removenumofsub();
                   }),
                   CustomText(
                       name: TaskCubit.get(context).numofsub.toString(),
                       alignmentGeometry: Alignment.center,
                       color:ColorManager.blacktowhite(context),
                       fontWeight: FontWeight.w600,
                       font: 25),
                   buildAddRem(Icons.add,() {
                     TaskCubit.get(context).increasenumofsub();
                   }),
                 ],
               ),
             ),
           ),
           CustomText(
               width: 335,
               name: AppStringsDir.Descriptionofthetask(context),
               alignmentGeometry: AppStringsDir.rtl(context),
               color:ColorManager.blacktowhite(context),
               fontWeight: FontWeight.w600,
               font: 14),
           CustomTextFormFeldnote(
             line: 7,
             controller: desc,
             textInputType: TextInputType.text,
             ii: 335,
             isStwich: false,
             i: 5,
             colorr: ColorManager.blackColor,
             color: ColorManager.blackColor,),
           const SizedBox(height: 30),
           dotBorderFile(335,75,() {
            TaskCubit.get(context).addPdf();
           },context),
           const SizedBox(height: 30),
           CustomBottonSend(name: AppStringsDir.Submitassignment(context), onPressed: (){
               if(globalKey.currentState!.validate()){
                 TaskCubit.get(context).AddTask(
                     title.text,
                     desc.text,
                     Provider.of<MenuMode>(context,listen: false).Employee,
                     Provider.of<ChoiseTaskMode>(context,listen: false).choise,
                     TaskCubit.get(context).file,
                     Provider.of<TimePickerMode>(context,listen: false).selectedDateS,
                     Provider.of<TimePickerMode>(context,listen: false).selectedDateE,
                     TaskCubit.get(context).numofsub,
                 );
               }

           }, height: 48, width: 335,color: ColorManager.greenColor,colorr: ColorManager.whiteColor,),
           const SizedBox(height: 30),
       ],
     ),
         ));
   }, listener: (BuildContext context, Object? state) {
           if(state is addtaskload){
             NeedBloc.showDelogSendTask(context,AppStringsDir.Submitassignment2(context), () { });
           }
           if(state is addtasksucc){
             desc.clear();
             title.clear();
             Provider.of<TimePickerMode>(context,listen: false).resetdate();
             TaskCubit.get(context).file.clear();
             navigatToback(context);
             navigatToback(context);
           }
   },);
  }

Widget rideoBottom(int i,String name,BuildContext context) {
    final cho=Provider.of<ChoiseTaskMode>(context).choise;
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: RadioListTile<int>(
            value: i,
            activeColor:cho==1? ColorManager.redColor:cho==2?ColorManager.starColor:ColorManager.greenColor,
            groupValue: cho,
            contentPadding: EdgeInsets.all(0),
            title: CustomText(name: name, fontWeight: FontWeight.w600, font: 12,alignmentGeometry: Alignment.centerRight),
            onChanged: (val)
            {
              print(val);
             Provider.of<ChoiseTaskMode>(context,listen: false).changeChoise(val!);
            }),
      ),
    );
  }

 Widget buildAddRem(IconData iconData,GestureTapCallback callback) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(onPressed: callback, icon: Icon(iconData))),
    );
 }

}