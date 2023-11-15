import 'package:intl/intl.dart';
import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:tasker/widgets/skeletons_widget.dart';

class HistoryDateTask extends StatelessWidget {
   HistoryDateTask({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: AppStringsDir.Recordtaskhistory(context),
        widget: Column(
          children: [
            SizedBox(height: 30),
            Container(
              height: 48,
              width: 305,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.dlcon(context),
              ),
              margin:EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Expanded(
                      child: CustomText2(alignmentGeometry: Alignment.centerLeft,name:AppStringsDir.date(context),color:ColorManager.blacktowhite(context), fontWeight: FontWeight.w600, font: 14)),
                  SizedBox(width: 15),
                  Expanded(
                      flex: 2,
                      child: CustomText2(alignmentGeometry: Alignment.centerLeft,name: AppStringsDir.Tasktitle(context),color: ColorManager.blacktowhite(context), fontWeight: FontWeight.w600, font: 14)),
                ],
              ),
            ),
            FutureBuilder(
              future: TaskCubit.get(context).getAllTask(),
              builder: (context, snapshot) {
               if(snapshot.hasData){
                 return Container(
                   width: 305,
                   child: ListView.builder(
                     itemCount: snapshot.data!.data.length,
                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (BuildContext context, int index) {
                       final data=snapshot.data!.data[index];
                       return Container(
                         height: 48,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: ColorManager.dlcon(context),
                         ),
                         margin:EdgeInsets.symmetric(vertical: 8),
                         padding: EdgeInsets.symmetric(vertical: 5),
                         child: Row(
                           children: [
                             SizedBox(width: 15),
                             Expanded(
                                 child: CustomText2(alignmentGeometry: Alignment.centerLeft,name: DateFormat('d MMM yyyy').format(data.dueDate),color:ColorManager.blacktowhite(context), fontWeight: FontWeight.w600, font: 14)),
                             SizedBox(width: 15),
                             Expanded(
                                 flex: 2,
                                 child: CustomText2(alignmentGeometry: Alignment.centerLeft,name: data.title,color: ColorManager.blacktowhite(context), fontWeight: FontWeight.w600, font: 14)),
                           ],
                         ),
                       );
                     },),
                 );
               }else{
                 return SkeletonsWidget2(index: 5);
               }
              }
            )
          ],
        ));
  }
}
