import 'package:flutter/material.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';

AppBar appBar(String name,BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.mainColor,
    title: CustomText(name: name, fontWeight: FontWeight.bold
        , font: 20,color: ColorManager.blackColor),
    centerTitle: true,
    leading: IconButton(onPressed: (){
      navigatToback(context);
    }, icon: Icon(Icons.arrow_back_ios,color: ColorManager.blackColor,)),
  );
}

AppBar appBar1(String name,BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.mainColor,
    leading: Container(),
    title: CustomText(name: name, fontWeight: FontWeight.bold
        , font: 20,color: ColorManager.blackColor),
    centerTitle: true,
  );
}