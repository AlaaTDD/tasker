import 'package:flutter/cupertino.dart';

import '../resources/string_manager.dart';

class MenuMode extends ChangeNotifier{
  String choise="";
  String Employee="";
  change(String choise,String Employee){
    this.choise=choise;
    this.Employee=Employee;
    notifyListeners();
  }
  chagetosearch(BuildContext context){
    choise= AppStringsDir.search(context);
    notifyListeners();
  }
}