import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/resources/string_manager.dart';

import '../customs/custom_text.dart';
import '../provider/time_picker_mode.dart';
import '../resources/color_management.dart';

Widget BuildTime(BuildContext context){
  return Container(
    width: 303,
    child: Row(
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
                width: 335,
                name:AppStringsDir.Expirydate(context),
                alignmentGeometry: AppStringsDir.rtl(context),
                color: ColorManager.blacktowhite(context),
                fontWeight: FontWeight.w500,
                font: 14),
            GestureDetector(
              onTap: (){
                Provider.of<TimePickerMode>(context,listen: false).selectTimeEnd(context);
              },
              child: Container(
                height: 33,
                width: 144,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: ColorManager.blacktowhite(context)
                    )
                ),
                child: Row(
                  children: [
                    Icon(Icons.date_range,color: ColorManager.greenColor,),
                    Expanded(child: CustomText(name: Provider.of<TimePickerMode>(context).formattedDate( Provider.of<TimePickerMode>(context).selectedDateE),alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 12)),
                  ],
                ),
              ),
            ),
          ],)),
        SizedBox(width: 15,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
                width: 335,
                name:AppStringsDir.startingdate(context) ,
                alignmentGeometry:AppStringsDir.rtl(context),
                color: ColorManager.blacktowhite(context),
                fontWeight: FontWeight.w500,
                font: 14),
            GestureDetector(
              onTap: (){
                Provider.of<TimePickerMode>(context,listen: false).selectTimeStart(context);
              },
              child: Container(
                height: 33,
                width: 144,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: ColorManager.blacktowhite(context)
                    )
                ),
                child: Row(
                  children: [
                    Icon(Icons.date_range,color: ColorManager.greenColor,),
                    Expanded(child: CustomText(name:Provider.of<TimePickerMode>(context).formattedDate( Provider.of<TimePickerMode>(context).selectedDateS),alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 12)),
                  ],
                ),
              ),
            ),
          ],)),
      ],
    ),
  );
}
Widget BuildTime1(BuildContext context,DateTime start,DateTime end){
  return Container(
    width: 303,
    child: Row(
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
                width: 335,
                name:AppStringsDir.startingdate(context) ,
                alignmentGeometry:AppStringsDir.rtl(context),
                color: ColorManager.blacktowhite(context),
                fontWeight: FontWeight.w500,
                font: 14),
            Container(
              height: 33,
              width: 144,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: ColorManager.blacktowhite(context)
                  )
              ),
              child: Row(
                children: [
                  Icon(Icons.date_range,color: ColorManager.greenColor,),
                  Expanded(child: CustomText(name:Provider.of<TimePickerMode>(context).formattedDate(start),alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 12)),
                ],
              ),
            ),
          ],)),
        SizedBox(width: 15,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
                width: 335,
                name:AppStringsDir.Expirydate(context),
                alignmentGeometry: AppStringsDir.rtl(context),
                color: ColorManager.blacktowhite(context),
                fontWeight: FontWeight.w500,
                font: 14),
            Container(
              height: 33,
              width: 144,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: ColorManager.blacktowhite(context)
                  )
              ),
              child: Row(
                children: [
                  Icon(Icons.date_range,color: ColorManager.greenColor,),
                  Expanded(child: CustomText(name: Provider.of<TimePickerMode>(context).formattedDate(end),alignmentGeometry: Alignment.centerRight, fontWeight: FontWeight.w600, font: 12)),
                ],
              ),
            ),
          ],)),
      ],
    ),
  );
}