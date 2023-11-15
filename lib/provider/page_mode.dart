import 'package:flutter/material.dart';

class PageMode extends ChangeNotifier {
  int page = 0;
  GetToken(int pagea){
    page=pagea;
    notifyListeners();
  }
}