import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerMode extends ChangeNotifier{
  DateTime selectedDateS = DateTime.now();
  DateTime selectedDateE = DateTime.now();
 void resetdate(){
   selectedDateS = DateTime.now();
   selectedDateE = DateTime.now();
   notifyListeners();
 }
  Future<void> selectTimeStart(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateS,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateS) {
      selectedDateS = picked;
        notifyListeners();
    }
  }
  String formattedDate(DateTime timeDate) {
    return DateFormat('MMM-d-yyyy').format(timeDate).toString();
  }
  Future<void> selectTimeEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateE,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateE) {
      selectedDateE = picked;
      notifyListeners();
    }
  }
}