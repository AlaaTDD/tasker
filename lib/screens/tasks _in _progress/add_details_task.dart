import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/screens/tasks%20_in%20_progress/show_all_taskes.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../customs/custom_outlinebottom.dart';
import '../../customs/custom_text_field.dart';

class AddDetailsTask extends StatelessWidget {
  const AddDetailsTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
    textDirection: AppStringsDir.textDirection(context),
      child: CustomWidget(
          text: AppStringsDir.Addtaskdetails(context),
          widget: Column(
            children: [
              const SizedBox(height: 50,),
              CustomText(width: 335,name:  AppStringsDir.Tasktitle(context), fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7),alignmentGeometry: AppStringsDir.rtl(context), font: 14),
              CustomTextFormFeldnote(textInputType: TextInputType.text, ii: 335, isStwich: false,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 5,line: 1,),
              const SizedBox(height: 30,),
              CustomText(width: 335,name:  AppStringsDir.Descriptionofthetask(context), fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7), alignmentGeometry: AppStringsDir.rtl(context), font: 14),
              CustomTextFormFeldnote(textInputType: TextInputType.text, ii: 335, isStwich: false,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 5,line: 1,),
              const SizedBox(height: 60,),
              CustomText(width: 335,name:  AppStringsDir.startingdate(context), fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7),alignmentGeometry: AppStringsDir.rtl(context),  font: 14),
              CustomTextFormFeldnote(textInputType: TextInputType.text, ii: 335, isStwich: false,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 5,line: 1,),
              const SizedBox(height: 30,),
              CustomText(width: 335,name: AppStringsDir.Expirydate(context), fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7),alignmentGeometry: AppStringsDir.rtl(context),  font: 14),
              CustomTextFormFeldnote(textInputType: TextInputType.text, ii: 335, isStwich: false,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 5,line: 1,),
              const SizedBox(height: 30,),
              SizedBox(
                width: 326,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomOutLineWithIcon(width:120 ,height: 40,colorr: ColorManager.greenColor,name: AppStringsDir.addition(context), iconData: Icons.add, onPressed: (){
                         navigatTo(context, ShowAllTaskes());
                      }, color: ColorManager.whiteColor),
                      CustomOutLineWithIcon(width:120 ,height: 40,colorr: ColorManager.redColor,name: AppStringsDir.delete(context), iconData: FontAwesomeIcons.close, onPressed: (){
                                navigatToback(context);
                      }, color: ColorManager.whiteColor),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
