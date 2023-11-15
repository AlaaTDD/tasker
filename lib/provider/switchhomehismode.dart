import 'package:flutter/cupertino.dart';

class SwitchHomeHisMode extends ChangeNotifier{
  bool switchscreen=true;
  changeswitchscreen(bool switchscreen){
    this.switchscreen=switchscreen;
    notifyListeners();
  }
}