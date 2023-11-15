import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_outlinebottom.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/screens/tasks%20_in%20_progress/taskes_screen.dart';
import 'package:tasker/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/switchhomehismode.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppStringsDir.textDirection1(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            ImageLogo(context),
            CustomText(
              onPressed: (){
               Provider.of<ThemeProvider>(context,listen: false).toggleTheme(false);
              },
                name: AppStringsDir.welcome(context),
                color: ColorManager.greenColor,
                fontWeight: FontWeight.bold,
                font: 24),
            CustomText(
                name: AppStringsDir.happyday(context),
                color: ColorManager.greenColor,
                fontWeight: FontWeight.w500,
                font: 14),
            SizedBox(
              height: 30,
            ),
            Align(
                alignment: AppStringsDir.rtl(context),
                child: CustomOutLineBottom(
                    height: 44,
                    width: 110,
                    name: AppStringsDir.Overview(context),
                    onPressed: () {},
                    color: ColorManager.greenColor)),
            SizedBox(
              height: 30,
            ),
            MissionBuild(AppStringsDir.Tasksinprogress(context),"4",ColorManager.greenColor,ColorManager.greenColor1,() {
              navigatTo(context, MyTaskesScreen());
            },context),
            SizedBox(
              height: 30,
            ),
            MissionBuild(AppStringsDir.Taskscompleted(context),"16",ColorManager.btnColor,ColorManager.btnColor1,() {
              Provider.of<SwitchHomeHisMode>(context,listen: false).changeswitchscreen(false);

            },context),
          ],
        ),
      ),
    );
  }
  Widget MissionBuild(String text,String num,Color color,Color color1,GestureTapCallback callback,BuildContext context){
    return  GestureDetector(
      onTap: callback,
      child: Container(
        height: 93,
        padding: EdgeInsets.only(right: 12, left: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color,
                  color1,
                ])),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomText(
                    height: 46.5,
                      name: num,
                      color: ColorManager.whiteColor,
                      fontWeight: FontWeight.w500,
                      font: 36),

                  CustomText(
                      name: AppStringsDir.task(context),
                      height: 46.5,
                      alignmentGeometry: Alignment.center,
                      color: ColorManager.whiteColor,
                      fontWeight: FontWeight.w500,
                      font: 14),

                ],
              ),
            ),
           const Spacer(),
            CustomText(
                name: text,
                color: ColorManager.whiteColor,
                fontWeight: FontWeight.w500,
                font: 24),
          ],
        ),
      ),
    );
  }
}
