import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';

import '../resources/string_manager.dart';


class CustomTextFormFeld extends StatefulWidget {
  final String? hinttext;
  final IconData? icon;
  final double? i;
  final Color? color;
  final Color? colorr;
  final IconData? suficon;
  final double? ii;
  final Function? onChange;
  final GestureTapCallback ? onClick;
  final GestureTapCallback ? cha;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextDirection? textDirection;
  final bool isStwich;
  CustomTextFormFeld({Key? key, this.hinttext,
    this.icon, this.suficon, this.onClick, this.cha,
    this.controller, this.color, this.colorr,
    required this.textInputType, required this.ii, this.i,
    this.onChange, this.textDirection,
    required this.isStwich
  }) : super(key: key);

  @override
  _CustomTextFormFeldState createState() => _CustomTextFormFeldState();
}

class _CustomTextFormFeldState extends State<CustomTextFormFeld> {
  bool cc = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.ii,
      child: TextFormField(

        validator: ( val)
        {
          if(val!.isEmpty&&widget.hinttext==AppStringsDir.email(context))
          {
            return AppStringsDir.email(context);
          }else if(val.length<6&&val.isEmpty&&widget.hinttext==AppStringsDir.pass(context))
          {
            return "ادخل ست احرف علي الاقل";
          }else if(val.length<6&&val.isEmpty&&widget.hinttext=="تحقق من كلمة المرور")
          {
            return "ادخل ست احرف علي الاقل";
          }

        },
        readOnly: widget.isStwich,
        obscureText: (widget.hinttext==AppStringsDir.pass(context)&&cc) ||(widget.hinttext==AppStringsDir.confirmpassword(context)&&cc)?true:false ,
        controller: widget.controller,
        maxLines:widget.hinttext==AppStringsDir.pass(context)||widget.hinttext==AppStringsDir.confirmpassword(context)?1:null,
        textDirection: widget.textDirection,
        style: TextStyle(color: ColorManager.blacktowhite(context),fontSize: 16,fontWeight: FontWeight.w600),
        cursorColor: ColorManager.blacktowhite(context),
        keyboardType: widget.textInputType,
        enabled: true,
        decoration: InputDecoration(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          hintText: widget.hinttext,
          hintStyle:  TextStyle(color: ColorManager.blacktowhite(context).withOpacity(0.3),fontSize: 11,fontWeight: FontWeight.bold),
          prefixIcon: Icon(widget.icon,color: ColorManager.blacktowhite(context)!.withOpacity(0.3),size: 15),
          suffixIcon:widget.hinttext==AppStringsDir.pass(context)||widget.hinttext==AppStringsDir.confirmpassword(context)? InkWell(
              onTap: ()
              {
                setState(() {
                  cc=!cc;
                });
              },
              child: Icon(widget.suficon,size: 17,color: ColorManager.blacktowhite(context).withOpacity(0.3))):null,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: ColorManager.blacktowhite(context),width: 1),
            borderRadius: BorderRadius.circular( widget.i!.toDouble()),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.blacktowhite(context),width: 1),
            borderRadius: BorderRadius.circular( widget.i!.toDouble()),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.blacktowhite(context),width: 1),
            borderRadius: BorderRadius.circular( widget.i!.toDouble()),
          ),
        ),
      ),
    );

  }
}


class CustomTextFormFeldnote extends StatefulWidget {
  final String? hinttext;
  final Widget? icon;
  final double? i;
  final Color? color;
  final Color? colorr;
  final int? line;
  final double? ii;
  final Function? onChange;
  final GestureTapCallback ? onClick;
  final GestureTapCallback ? cha;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextDirection? textDirection;
  final bool isStwich;
  CustomTextFormFeldnote({Key? key, this.hinttext,
    this.icon, this.line, this.onClick, this.cha,
    this.controller, this.color, this.colorr,
    required this.textInputType, required this.ii, this.i,
    this.onChange, this.textDirection,
    required this.isStwich
  }) : super(key: key);

  @override
  _CustomTextFormFeldnoteState createState() => _CustomTextFormFeldnoteState();
}

class _CustomTextFormFeldnoteState extends State<CustomTextFormFeldnote> {
  bool cc = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.ii,
      child: TextFormField(

        validator: ( val)
        {
          if(val!.isEmpty&&widget.hinttext=="البريد الالكتروني")
          {
            return "ادخل البريد الالكتروني";
          }else if(val.length<6&&val.isEmpty&&widget.hinttext==AppStringsDir.pass(context))
          {
            return "ادخل ست احرف علي الاقل";
          }else if(val.length<6&&val.isEmpty&&widget.hinttext=="تحقق من كلمة المرور")
          {
            return "ادخل ست احرف علي الاقل";
          }

        },
        readOnly: widget.isStwich,
        obscureText: (widget.hinttext==AppStringsDir.pass(context)&&cc) ||(widget.hinttext=="تحقق من كلمة المرور"&&cc)?true:false ,
        controller: widget.controller,
        maxLines:widget.line,
        textDirection: widget.textDirection,
        style: TextStyle(color: ColorManager.blacktowhite(context),fontSize: 16,fontWeight: FontWeight.w300),
        cursorColor: ColorManager.blacktowhite(context),
        keyboardType: widget.textInputType,
        enabled: true,

        decoration: InputDecoration(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          hintText: widget.hinttext,
          hintStyle:  TextStyle(color: ColorManager.blacktowhite(context).withOpacity(0.3),fontSize: 11,fontWeight: FontWeight.bold),
          suffixIcon: widget.icon,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: ColorManager.blacktowhite(context),width: 1),
            borderRadius: BorderRadius.circular( widget.i!.toDouble()),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.blacktowhite(context),width: 1),
            borderRadius: BorderRadius.circular( widget.i!.toDouble()),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.blacktowhite(context),width: 1),
            borderRadius: BorderRadius.circular( widget.i!.toDouble()),
          ),
        ),
      ),
    );

  }
}