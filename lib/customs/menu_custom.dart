import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/resources/string_manager.dart';
import '../models/user_model.dart';
import '../provider/menu_mode.dart';
import '../resources/color_management.dart';

class MenuCustom extends StatelessWidget {
   MenuCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final v=Provider.of<MenuMode>(context).choise;
    final f=Provider.of<MenuMode>(context,listen: false);
    return FutureBuilder(
      future: TaskCubit.get(context).getDataoneUser(),
      builder: (context,snapshot) {
     if(snapshot.hasData){
       List<String>listName=[AppStringsDir.search(context)];
       snapshot.data!.data.forEach((element) {
         listName.add(element.name);
       });
       return Card(
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10)
         ),
         child: Container(
           alignment: Alignment.center,
           width: 335,
           padding: const EdgeInsets.symmetric(horizontal: 15.0),

           child: Directionality(
             textDirection: TextDirection.rtl,
             child: DropdownButtonHideUnderline(
               child: DropdownButton<String>(
                 dropdownColor:ColorManager.dlcon(context),
                 value: v,
                 icon:  Expanded(child: Container(
                     alignment: Alignment.centerLeft,
                     child: Icon(Icons.arrow_drop_down,color:ColorManager.blacktowhite(context),))),
                 elevation: 16,
                 style:  TextStyle(color:ColorManager.blacktowhite(context),fontSize: 14,fontWeight: FontWeight.w600),
                 underline: Container(
                   height: 2,
                   color:  ColorManager.blackColor,
                 ),
                 onChanged: (String? newValue) {
                   Datum result = snapshot.data!.data.firstWhere(
                         (user) => user.name == newValue,
                   );
                   f.change(newValue!,result.id);
                 },
                 items:   listName
                     .map<DropdownMenuItem<String>>((String value) {
                   return  DropdownMenuItem<String>(
                     value: value,
                     child: CustomText(name: value, fontWeight: FontWeight.w600,alignmentGeometry: Alignment.centerRight, font: 14),
                   );
                 }).toList(),
               ),
             ),
           ),
         ),
       );
     }else {
       return CircularProgressIndicator();
     }
      }
    );
  }
}
