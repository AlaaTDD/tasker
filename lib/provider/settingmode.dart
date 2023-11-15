import 'package:flutter/cupertino.dart';

class SettingMode extends ChangeNotifier{
  String lan="ar";
  changelan(String lan){
    this.lan=lan;
    notifyListeners();
  }
  bool darkmode=false;
  changedarkmode(bool darkmode){
    this.darkmode=darkmode;
    notifyListeners();
  }
}