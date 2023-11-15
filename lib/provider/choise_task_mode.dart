import 'package:flutter/cupertino.dart';

class ChoiseTaskMode extends ChangeNotifier{
  int choise=1;
  changeChoise(int choise){
    this.choise=choise;
    notifyListeners();
  }
}