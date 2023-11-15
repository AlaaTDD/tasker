import 'package:tasker/customs/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:tasker/resources/color_management.dart';

class CustomBotton1 extends StatefulWidget {
  final String name;
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color? color;
  final Color? colorr;
  CustomBotton1({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.colorr,
  }) : super(key: key);
  @override
  State<CustomBotton1> createState() => _CustomBotton1State();
}

class _CustomBotton1State extends State<CustomBotton1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(color: ColorManager.blueColor),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.name,
          style: TextStyle(
              color: widget.colorr, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomBotton extends StatefulWidget {
  final String name;
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color? color;
  final Color? colorr;
  CustomBotton({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.colorr,
  }) : super(key: key);
  @override
  State<CustomBotton> createState() => _CustomBottonState();
}

class _CustomBottonState extends State<CustomBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(10)),
        child: Text(
          widget.name,
          style: TextStyle(
              color: widget.colorr, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomBottonLogin extends StatefulWidget {
  final String name;
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color? color;
  final Color? colorr;
  CustomBottonLogin({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.colorr,
  }) : super(key: key);
  @override
  State<CustomBottonLogin> createState() => _CustomBottonLoginState();
}

class _CustomBottonLoginState extends State<CustomBottonLogin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topCenter ,
                end: Alignment.bottomCenter,
                colors: [
              ColorManager.topColor,
              ColorManager.bottonColor,
               ]),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          widget.name,
          style: TextStyle(
              color: widget.colorr,fontFamily: "Cairo", fontSize: 25,),
        ),
      ),
    );
  }
}
class CustomBottonB extends StatefulWidget {
  final String name;
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color? color;
  final Color? colorr;
  CustomBottonB({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.colorr,
  }) : super(key: key);
  @override
  State<CustomBottonB> createState() => _CustomBottonBState();
}

class _CustomBottonBState extends State<CustomBottonB> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(15)),
        child: Text(
          widget.name,
          style: TextStyle(
              color: widget.colorr, fontSize: 18,fontFamily: "Cairo", fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


class CustomBottonSend extends StatefulWidget {
  final String name;
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Color? color;
  final Color? colorr;
  CustomBottonSend({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color,
    this.colorr,
  }) : super(key: key);
  @override
  State<CustomBottonSend> createState() => _CustomBottonSendState();
}

class _CustomBottonSendState extends State<CustomBottonSend> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(10)),
        child: CustomText(name: widget.name, fontWeight: FontWeight.w600, font: 20,fontFa: "Cairo",color: widget.colorr),
      ),
    );
  }
}
