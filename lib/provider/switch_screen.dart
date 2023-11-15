import 'package:flutter/cupertino.dart';

class SwitchMainScreen extends ChangeNotifier{
  bool mainscreen=true;
  ChangeScreen(bool mainscreen){
    this.mainscreen=mainscreen;
    print(mainscreen);
    notifyListeners();
  }
}