import 'package:tasker/customs/custom_text.dart';
import 'package:flutter/material.dart';
import '../resources/color_management.dart';

class CustomOutLineBottom extends StatelessWidget {
  final String name;
  final GestureTapCallback onPressed;
  final Color color;
  final Color? colorr;
  final double? width;
  final double? height;
  CustomOutLineBottom({Key? key,
    required this.name,
    required this.onPressed,
    required this.color,  this.colorr,  this.height, this.width,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shadowColor: color,
          backgroundColor: colorr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: BorderSide(width: 1.5, color: color),
        ),
        onPressed:onPressed,
        child: CustomText(name: name, fontWeight: FontWeight.bold, font: 14,color: color),
      ),
    );
  }
}

class CustomOutLineWithIcon extends StatelessWidget {
  final String name;
  final IconData iconData;
  final GestureTapCallback onPressed;
  final Color color;
  final double? width;
  final Color? colorr;
  final double? height;
  CustomOutLineWithIcon({Key? key,
    required this.name,
    required this.iconData,
    required this.onPressed,
    required this.color,  this.height,this.colorr, this.width,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),

        ),
        label: CustomText(name: name, fontWeight: FontWeight.bold, font: 14,color: color,),
        onPressed:onPressed,
        icon: Icon(iconData,color: color,),
      ),
    );
  }
}
class CustomOutLineWithIcon2 extends StatelessWidget {
  final String name;
  final IconData iconData;
  final GestureTapCallback onPressed;
  final Color color;
  final Color? colorIcon;
  final double? width;
  final double? height;
  CustomOutLineWithIcon2({Key? key,
    required this.name,
    required this.iconData,
    required this.onPressed,
    required this.color,this.colorIcon,  this.height, this.width,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          shadowColor: color,
          backgroundColor: ColorManager.redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          side: BorderSide(width: 0.6, color: color),
        ),
        label:  Text(name,style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.bold
        ),),
        onPressed:onPressed,
        icon: Icon(iconData,color:colorIcon==null?color:colorIcon,),
      ),
    );
  }
}


