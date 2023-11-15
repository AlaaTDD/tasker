import 'package:flutter/cupertino.dart';

class TimeMode extends ChangeNotifier{
  String name="1";
  ChangeName(String name){
    this.name=name;
    notifyListeners();
  }
}