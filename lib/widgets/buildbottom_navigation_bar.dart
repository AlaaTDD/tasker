import 'package:tasker/provider/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/page_mode.dart';
import '../provider/switchhomehismode.dart';
import '../resources/color_management.dart';

class buildbottomNavigationBar extends StatelessWidget {
  const buildbottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15)
        ),

        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), // Shadow color
            offset: Offset(0, -1), // Negative Y offset to make the shadow appear at the top
            blurRadius: 5, // Spread of the shadow
            spreadRadius: 7, // Extent of the shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          columBuild("assets/icons/Home.png",0,context),
          columBuild("assets/icons/Calendar (1).png",1,context),
          columBuild("assets/icons/Profile.png",2,context),
        ],
      ),
    );
  }
  Widget columBuild(String icon,int index,BuildContext context){
    final page=Provider.of<PageMode>(context).page;
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Provider.of<PageMode>(context,listen: false).GetToken(index);
          Provider.of<SwitchMainScreen>(context,listen: false).ChangeScreen(true);

          },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(icon,color: page==index?ColorManager.greenColor:Colors.grey.withOpacity(0.5),),
            ),
            Spacer(),
             if(index==page)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset("assets/icons/Vector 1.png"),
            ),
          ],
        ),
      ),
    );
  }
}
