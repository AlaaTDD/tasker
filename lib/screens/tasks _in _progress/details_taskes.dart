import 'package:tasker/bloc/subtask/subtask_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_outlinebottom.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/screens/tasks%20_in%20_progress/Rate_task_screen.dart';
import 'package:tasker/screens/tasks%20_in%20_progress/add_details_task.dart';
import 'package:tasker/screens/tasks%20_in%20_progress/send_task.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import '../../customs/custom_text_field.dart';
import '../../models/task_model.dart';
import '../../widgets/time_widget.dart';

class DetailsTaskes extends StatelessWidget {
  Datum datum;
  DetailsTaskes({super.key, required this.datum});
  TextEditingController note=TextEditingController();
  @override
  Widget build(BuildContext context) {
    note.text=datum.description;
    int monthsDifference = datum.dueDate.month - DateTime.now().month;
    int daysDifference =  datum.dueDate.day -  DateTime.now().day;
    int hoursDifference = datum.dueDate.hour -  DateTime.now().hour;

    // Adjust for negative differences
    if (hoursDifference < 0) {
      daysDifference -= 1;
      hoursDifference += 24;
    }

    if (daysDifference < 0) {
      monthsDifference -= 1;
      daysDifference += DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
    }
    return Directionality(
      textDirection: AppStringsDir.textDirection(context),
      child: CustomWidget(
          callback: (){
            navigatTo(context, RateTaskScreen());
          },
          text: AppStringsDir.Taskdetails(context),
          widget: Column(
            children: [
              Container(
                width: 303,
                height: 58,
                padding:const EdgeInsets.symmetric(horizontal: 10),
                margin:const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:datum.priority==3? ColorManager.redColor:datum.priority==2?ColorManager.starColor:ColorManager.greenColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color:datum.priority==3?ColorManager.redColor.withOpacity(0.1):datum.priority==2?ColorManager.starColor.withOpacity(0.1) :ColorManager.greenColor1.withOpacity(0.3)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  CircleAvatar(radius: 20,backgroundColor: datum.priority==3? ColorManager.redColor:datum.priority==2?ColorManager.starColor:ColorManager.greenColor,child: Icon(Icons.done,color: ColorManager.whiteColor,),),
                  CustomText(name:datum.priority==3? "${AppStringsDir.Taskpriority(context)} : ${AppStringsDir.High(context)}":datum.priority==2? "${AppStringsDir.Taskpriority(context)} : ${AppStringsDir.middle(context)}":"${AppStringsDir.Taskpriority(context)} : ${AppStringsDir.Low(context)}", fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7), font: 14)
                ]),
              ),
              BuildTime1(context,datum.startDate,datum.dueDate),
              const SizedBox(height: 20,),
              CustomText(
                  width: 303,
                  name: AppStringsDir.Theremainingtimeforthetask(context),
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.blacktowhite(context).withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  font: 15),
              const SizedBox(height: 20,),
              SizedBox(width: 325,
              child: Row(
                children: [
                  BuildThreeTime("$hoursDifference",AppStringsDir.hour(context)),
                  SizedBox(width: 5,),
                  BuildThreeTime("$daysDifference ",AppStringsDir.day(context)),
                  SizedBox(width: 5,),
                  BuildThreeTime("$monthsDifference",AppStringsDir.month(context)),
                ],
              ),
              ),
              const SizedBox(height: 20,),
              CustomText(width: 326,alignmentGeometry: AppStringsDir.rtl(context),name: AppStringsDir.Descriptionofthetask(context), fontWeight: FontWeight.w600, font: 16,color: ColorManager.blacktowhite(context).withOpacity(0.7),),
              CustomTextFormFeldnote(controller:note ,textInputType: TextInputType.text, ii: 326, isStwich: true,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 10,line: 8,),
              const SizedBox(height: 20,),
              CustomText(width: 326,alignmentGeometry: AppStringsDir.rtl(context),name: AppStringsDir.Therestofthework(context), fontWeight: FontWeight.w600, font: 15,color: ColorManager.blacktowhite(context).withOpacity(0.7),),
              const SizedBox(height: 10,),
              FutureBuilder(
                future: SubtaskCubit.get(context).getSubTaskByTaskid(datum.id),
                builder: (context, snapshot) { 
                if(snapshot.hasData){
                  return SizedBox(
                    width: 326,
                    child: Stack(
                        alignment: Alignment.center,
                        children: [
                          LinearProgressIndicator(
                            value:  (snapshot.data!.data.length/datum.numofsubtask).toDouble(),
                            borderRadius: BorderRadius.circular(15),
                            minHeight: 35,
                            backgroundColor: ColorManager.greenColor1.withOpacity(0.4),
                            color:ColorManager.redColor,
                          ),
                          CustomTextPoppins(alignmentGeometry: Alignment.center,name: "${((snapshot.data!.data.length/datum.numofsubtask)*100).toStringAsFixed(1)}%", fontWeight: FontWeight.w600, font: 16,color: ColorManager.whiteColor,),

                        ]
                    ),
                  );
                }else{
                  return SizedBox(
                    width: 326,
                    child: Stack(
                        alignment: Alignment.center,
                        children: [
                          LinearProgressIndicator(
                            value:  (1/datum.numofsubtask).toDouble(),
                            borderRadius: BorderRadius.circular(15),
                            minHeight: 35,
                            backgroundColor: ColorManager.greenColor1.withOpacity(0.4),
                            color:ColorManager.redColor,
                          ),
                          CustomTextPoppins(alignmentGeometry: Alignment.center,name: "${((1/datum.numofsubtask)*100).toString()}%", fontWeight: FontWeight.w600, font: 16,color: ColorManager.whiteColor,),

                        ]
                    ),
                  );
                }
              }, ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 326,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOutLineWithIcon(width:120 ,height: 45,colorr: ColorManager.btniconColor,name: AppStringsDir.Delivery(context), iconData: Icons.done, onPressed: (){
                      navigatTo(context, SendTask(datum: datum,));
                    }, color: ColorManager.whiteColor),
                    CustomOutLineWithIcon(width:120 ,height: 45,colorr: ColorManager.greenColor,name: AppStringsDir.addition(context), iconData: Icons.add, onPressed: (){
                      navigatTo(context, AddDetailsTask());
                    }, color: ColorManager.whiteColor),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
            ],
          )),
    );
  }

 Widget BuildThreeTime(String s, String t) {
    return Expanded(
      child: Container(
        width: 105,
        height: 86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.greenColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextPoppins(
                name: s,
                alignmentGeometry: Alignment.bottomCenter,
                fontWeight: FontWeight.bold,
                font: 40,
                color: ColorManager.whiteColor,),
            ),
            Expanded(
              child: CustomText(
                name: t,
                alignmentGeometry: Alignment.center,
                fontWeight: FontWeight.w500,
                font: 14,
                color: ColorManager.whiteColor,),
            ),
          ],
        ),
      ),
    );
 }

}
