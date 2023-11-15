import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../customs/custom_bottom.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_text_field.dart';
import '../../provider/choise_task_mode.dart';
import '../../provider/time_picker_mode.dart';
import '../../resources/color_management.dart';
import '../../widgets/dot_border.dart';
import '../../widgets/time_widget.dart';


class EditTaskes extends StatelessWidget {
  String ID;
  EditTaskes({super.key,required this.ID});
  TextEditingController adress = TextEditingController();
  TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    adress.text = "UI Mobile Development";
   return BlocConsumer<TaskCubit,TaskState>(
     builder: (BuildContext context, state) {
     return CustomWidget(text: AppStringsDir.edit(context), widget: Column(
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
           controller: adress,
           icon: Image.asset("assets/icons/pin.png"),
           textInputType: TextInputType.text,
           ii: 335,
           isStwich: false,
           i: 5,
           colorr: ColorManager.blackColor,
           color: ColorManager.blackColor,
         ),
         const SizedBox(height: 40),
         BuildTime(context),
         const SizedBox(height: 30),
         CustomText(
             width: 335,
             name:AppStringsDir.Taskpriority(context),
             alignmentGeometry: AppStringsDir.rtl(context),
             color: ColorManager.blacktowhite(context),
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
         const SizedBox(height: 30),
         CustomText(
             width: 335,
             name: AppStringsDir.Descriptionofthetask(context),
             alignmentGeometry: AppStringsDir.rtl(context),
             color: ColorManager.blacktowhite(context),
             fontWeight: FontWeight.w600,
             font: 14),
         CustomTextFormFeldnote(
           line: 7,
           controller: note,
           textInputType: TextInputType.text,
           ii: 335,
           isStwich: false,
           i: 5,
           colorr: ColorManager.blackColor,
           color: ColorManager.blackColor,
         ),
         const SizedBox(height: 30),
         dotBorderFile(335,75,() {
            TaskCubit.get(context).updatePdf();
         },context),
         const SizedBox(height: 30),
         CustomBottonSend(
           name: AppStringsDir.edit(context),
           onPressed: () {
             TaskCubit.get(context).updatedata(
                 adress.text,
                 note.text,
                 ID,
                 Provider.of<ChoiseTaskMode>(context, listen: false).choise,
                 TaskCubit.get(context).file2,
                 Provider.of<TimePickerMode>(context,listen: false).selectedDateS,
                 Provider.of<TimePickerMode>(context,listen: false).selectedDateE,);
           },
           height: 48,
           width: 335,
           color: ColorManager.greenColor,
           colorr: ColorManager.whiteColor,
         ),
         const SizedBox(height: 30),
       ],
     ));
   }, listener: (BuildContext context, Object? state) {
       if(state is udatetasksucc){
         adress.clear();
         note.clear();
         TaskCubit.get(context).file2.clear();
         Provider.of<TimePickerMode>(context,listen: false).resetdate();
         navigatToback(context);
       }

   },);
  }
  Widget rideoBottom(int i, String name, BuildContext context) {
    final cho = Provider.of<ChoiseTaskMode>(context).choise;
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: RadioListTile<int>(
            value: i,
            activeColor: cho == 1
                ? ColorManager.redColor
                : cho == 2
                    ? ColorManager.starColor
                    : ColorManager.greenColor,
            groupValue: cho,
            contentPadding: EdgeInsets.all(0),
            title:
                CustomText(name: name,alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 12),
            onChanged: (val) {
              Provider.of<ChoiseTaskMode>(context, listen: false)
                  .changeChoise(val!);
            }),
      ),
    );
  }
}
