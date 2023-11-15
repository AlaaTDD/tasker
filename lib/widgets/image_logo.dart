import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Widget ImageLogo(BuildContext context){
  final isDark=Provider.of<ThemeProvider>(context).isDark;
  return Image.asset("assets/images/logo2.png",color: isDark?ColorManager.whiteColor:null,);
}