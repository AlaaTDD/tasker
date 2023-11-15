import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../customs/custom_text.dart';
import '../resources/color_management.dart';

Widget dotBorderFile(double width,double height ,GestureTapCallback callback,BuildContext context){
  return GestureDetector(
    onTap: callback,
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      dashPattern: const [10, 4],
      strokeCap: StrokeCap.round,
      color: ColorManager.dlcon(context),
      child: Container(
        width:width,
        height: height,
        decoration: BoxDecoration(
          color: ColorManager.dlcon(context).withOpacity(.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomTextPoppins(name:  'Choose a file or drag it here',
          font:12 ,
          alignmentGeometry: Alignment.center,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}