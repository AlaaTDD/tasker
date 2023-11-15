import 'package:flutter/cupertino.dart';

class SwitchScreenMode extends ChangeNotifier{
  bool switchscreen=true;
  changeswitchscreen(bool switchscreen){
    this.switchscreen=switchscreen;
    notifyListeners();
  }
}