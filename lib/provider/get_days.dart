import 'package:flutter/cupertino.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';
import 'package:provider/provider.dart';
import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/resources/string_manager.dart';

class GetDays extends ChangeNotifier{
  List<String> hijriDay = [];
  String dategregorian="1-2-2023";
  dateGregorian(int year,int month,int day,){
    HijriCalendar hijriDatee = HijriCalendar(); // Initialize the variable
    DateTime date =  hijriDatee.hijriToGregorian(year, month, day);
    dategregorian= "${date.month}-${date.day}-${date.year}";
    print(dategregorian);
    notifyListeners();
  }
  int month=1;
  changeMonth(int month){
    this.month=month;
    notifyListeners();
  }
  String GetDay(int month,int day,BuildContext context){
    HijriCalendar.setLocal(AppStringsDir.entar(context));
    late HijriCalendar hijriDate = HijriCalendar.now();
    final dd=  JDateModel(
        jhijri: JHijri(
          fDay: day,
          fMonth:month,
          fYear: hijriDate.hYear,
        ));
    final isAr=Provider.of<ThemeProvider>(context,listen: false).lan;
   print(dd.jhijri!.dayName);
   if(!isAr) return dd.jhijri!.dayName;
   else return dayEntoAr(dd.jhijri!.dayName);
  }

  String dayEntoAr(String name){
   if(name=="السبت"){
     return "Saturday";
   } else if(name=="الأحد"){
     return "Sunday";
   }else if(name=="الإثنين"){
     return "Monday";
   }else if(name=="الثلاثاء"){
     return "Tuesday";
   }else if(name=="الأربعاء"){
     return "Wednesday";
   }else if(name=="الخميس"){
     return "Thursday";
   }else if(name=="الجمعة"){
     return "Friday";
   }else{
     return "";
   }
}
}