import 'package:hijri/hijri_calendar.dart';
import 'package:tasker/admin/management_tasks/edit_taskes.dart';
import 'package:tasker/bloc/subtask/subtask_cubit.dart';
import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasker/widgets/skeletons_widget.dart';
import '../../customs/constants.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_text_field.dart';
import '../../resources/color_management.dart';


class FollowTaskes extends StatelessWidget {
  const FollowTaskes({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomWidget(text:AppStringsDir.follow(context), widget: Column(
      children: [
        const SizedBox(height: 20),
        Directionality(
            textDirection: TextDirection.rtl,
            child: CustomTextFormFeldnote(line: 1,textInputType: TextInputType.text,hinttext:"البحث" , ii: 335, isStwich: false,i: 30,colorr: ColorManager.blackColor,color: ColorManager.blackColor,)),
        const SizedBox(height: 20),
        Container(
          width: 355,
          height: 56,
          decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                    color: ColorManager.blackColor.withOpacity(0.2)
                ),
              )
          ),
          child: Row(children: [
            Expanded(
                flex: 3,
                child: CustomText(name: AppStringsDir.task(context), fontWeight: FontWeight.w600, font: 13)),
            Expanded( flex: 2,
                child: CustomText(name: AppStringsDir.condition(context), fontWeight: FontWeight.w600, font: 13)),
            Expanded( flex: 2,child: CustomText(name: AppStringsDir.ManagerEmployee(context), fontWeight: FontWeight.w600, font: 13)),
          ]),
        ),
        const SizedBox(height: 30),
        Container(
          width: 385,
          child: FutureBuilder(
            future: TaskCubit.get(context).getTask(),
            builder: ( context, snapshot) {
            if(snapshot.hasData){
             return ListView.builder(
               itemCount: snapshot.data!.data.length,
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemBuilder: (BuildContext context, int index) {
                 final data=snapshot.data!.data[index];
                 return FutureBuilder(
                     future: SubtaskCubit.get(context).getTaskAdmin(data.id),
                     builder: (context,snapshott) {
                       if(snapshott.hasData){
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             children: [
                               Expanded(
                                   flex:3,
                                   child: Row(
                                     children: [
                                       Expanded(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             CustomTextPoppins(name: data.title, fontWeight: FontWeight.bold, font: 9),
                                             Row(
                                               children: [
                                                 CustomText(name: "${((snapshott.data!.data.length/data.numofsubtask).toDouble()*100).toStringAsFixed(0)}%", fontWeight: FontWeight.w600, font: 11),
                                                 Expanded(
                                                   child: LinearProgressIndicator(
                                                     value:  (snapshott.data!.data.length/data.numofsubtask).toDouble(),
                                                     minHeight: 3,
                                                     backgroundColor: ColorManager.greenColor1.withOpacity(0.4),
                                                     color: data.status==2?ColorManager.greenColor: data.status==3?ColorManager.starColor:ColorManager.redColor,
                                                   ),
                                                 ),
                                               ],
                                             ),                              ],
                                         ),
                                       ),
                                       Container(
                                         height: 12,
                                         width: 12,
                                         decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: data.status==2?ColorManager.greenColor:null,
                                             border: Border.all(
                                               color: data.status==2?ColorManager.greenColor:data.status==3?ColorManager.blackColor.withOpacity(0.5):ColorManager.redColor,
                                             )
                                         ),
                                         child:data.status==2?Icon(Icons.done,color: ColorManager.whiteColor,size: 7,):null ,
                                       ),
                                     ],
                                   )),
                               Expanded(
                                   flex:2,
                                   child:
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [
                                       CustomText(name:data.status==2?AppStringsDir.Completed(context): AppStringsDir.notcomplete(context), fontWeight: FontWeight.w600, font: 11,color: data.status==2?ColorManager.greenColor:data.status==3?ColorManager.starColor:ColorManager.redColor,
                                       ),
                                       CustomText(name: formatHijriDate(data.startDate), fontWeight: FontWeight.w600,color: ColorManager.blackColor.withOpacity(0.5), font: 9),
                                     ],
                                   )),
                               Expanded(
                                 flex:2,
                                 child: GestureDetector(
                                   onTap: (){
                                     navigatTo(context, EditTaskes(ID: data.id,));
                                   },
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       CustomText(name: data.employeeId.name, fontWeight: FontWeight.w600, font: 11),
                                       SizedBox(width: 5,),
                                       Image.asset("assets/icons/pin.png",color: ColorManager.greenColor,)
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         );
                       }else{
                         return SkeletonsWidget2(index: 1);
                       }

                     }
                 );
               },);
            }else{
              return SkeletonsWidget2(index: 4);
            }
          },),
        ),
         const SizedBox(height: 10,)
      ],
    ));
  }
  String formatHijriDate(DateTime hijriDate) {
    HijriCalendar.setLocal("ar");
    final date=  HijriCalendar.fromDate(hijriDate).toFormat('d MMMM');
    return date.toString();
  }

}
