import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customs/constants.dart';
import '../screens/splash_screen/spashscreen.dart';




class SharePer{
   static  saveData(String token,String tokenValue)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString(token, tokenValue);
  }

   static Future<String> getData(String token)async{
    SharedPreferences sharedPreferences=  await SharedPreferences.getInstance();
    if(sharedPreferences.getString(token) != null){
     return sharedPreferences.getString(token).toString();
    }else{
      return "NA";
    }
  }
   static  removeData(String token)async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     await sharedPreferences.remove(token);
   }
}