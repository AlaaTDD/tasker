import 'package:tasker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorManager {
  static Color mainColor = const Color(0xffF2F4F5);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color greenColor = Color(0xff046B5A);
  static Color greenColor1 = Color(0xff26D0B4);
  static Color btnColor = Color(0xff7D9490);
  static Color btnColor1 = Color(0xffC4C4C4);
  static Color btnColor2 = Color(0xff33524D);
  static Color btnColor3 = Color(0xff33524D);
  static Color blackColor = const Color(0xff000000);
  static Color blueColor = const Color(0xff0861F2);
  static Color redColor = const Color(0xffE4393F);
  static Color topColor = const Color(0xff444444);
  static Color bottonColor = const Color(0xff9A9A9A);
  static Color logodoneColor = const Color(0xffD3EADD);
  static Color personColor = const Color(0xffD9D9D9);
  static Color grayColor = const Color(0xffE6E9EA);
  static Color grayLanColor = const Color(0xffF1F2F2);
  static Color RedRate = const Color(0xffDC2626);
  static Color listtitle1 = const Color(0xffF59E0B);
  static Color listtitle2 = const Color(0xff701A75);
  static Color greenColor2 = Color(0xff00BA9B);
  static Color greenColor3 = Color(0xff198573);
  static Color greenColor4 = Color(0xff26D0B4);
  static Color starColor = Color(0xffED8A19);
  static Color btniconColor = Color(0xffC4C4C4);
  static Color chart1 = Color(0xffB1D199);
  static Color chart2 = Color(0xffFFB35A);
  static Color chart3 = Color(0xffD66357);
  static Color containerColor = Color(0xff424242);

  // dark /light
  static Color blacktowhite(BuildContext context)=>Provider.of<ThemeProvider>(context).isDark?whiteColor: blackColor;
  static Color greentowhite(BuildContext context)=>Provider.of<ThemeProvider>(context).isDark?whiteColor: greenColor;
  static Color blacktogray(BuildContext context)=>Provider.of<ThemeProvider>(context).isDark? blackColor:grayColor;
  static Color backtograylan(BuildContext context)=>Provider.of<ThemeProvider>(context).isDark? Colors.grey.shade900:grayLanColor;
  static Color dlcon(BuildContext context)=>Provider.of<ThemeProvider>(context).isDark? containerColor:mainColor;

}