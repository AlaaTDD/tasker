import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier
{
  bool lan=false;
  changelan(bool lan){
    this.lan=lan;
    notifyListeners();
  }
  bool isDark=false;
  void toggleTheme(bool isOn)
  {
    isDark=isOn;
    notifyListeners();
  }
}

class Mythemes
{
  static final darkTheme=ThemeData(
scaffoldBackgroundColor: Colors.grey.shade900,
colorScheme: const ColorScheme.dark(),
  primarySwatch: Colors.blue,
  backgroundColor: ColorManager.whiteColor,
  splashColor: ColorManager.blackColor.withOpacity(0.5),
    appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey.shade900,
      statusBarColor: Colors.grey.shade900,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  ),
);
static final lightTheme=ThemeData(
  scaffoldBackgroundColor: ColorManager.whiteColor,
  primarySwatch: Colors.indigo,
  backgroundColor: ColorManager.blackColor,
  splashColor: ColorManager.whiteColor,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: ColorManager.whiteColor,
      statusBarColor: ColorManager.whiteColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
  colorScheme: const ColorScheme.light(),

);
}