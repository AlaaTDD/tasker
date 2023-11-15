import 'package:tasker/provider/settingmode.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/resources/string_manager.dart';

import '../../customs/constants.dart';
import '../../customs/custom_text.dart';
import '../../provider/theme_provider.dart';

class SettingApp extends StatelessWidget {
  const SettingApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ar=Provider.of<ThemeProvider>(context).lan;
    final darkmode=Provider.of<SettingMode>(context).darkmode;
    return Scaffold(
      body: Directionality(
        textDirection: AppStringsDir.textDirection(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 36,
                      ),
                      CustomText(
                          name: AppStringsDir.Applicationsettings(context),
                          alignmentGeometry: Alignment.center,
                          color: ColorManager.greentowhite(context),
                          fontWeight: FontWeight.w500,
                          font: 20),
                      InkWell(
                        onTap: () {
                          navigatToback(context);
                        },
                        child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      ColorManager.greenColor,
                                      ColorManager.greenColor1,
                                    ])),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: ColorManager.whiteColor,
                              size: 17,
                            )),
                      ),

                    ]),
              ),
             const SizedBox(
                height: 60,
              ),
              Image.asset("assets/images/Line 16.png"),
              const  SizedBox(
                height: 35,
              ),
              Container(
                width: 359,
                height: 76,
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: ColorManager.dlcon(context),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        name: AppStringsDir.language(context),
                        alignmentGeometry: Alignment.center,
                        color:ColorManager.blacktowhite(context),
                        fontWeight: FontWeight.w500,
                        font: 20),
                     Container(
                       width: 96,
                       height: 40,
                       decoration: BoxDecoration(
                           color: ColorManager.backtograylan(context),
                           borderRadius: BorderRadius.circular(15)
                       ),
                       child: Row(
                         children: [

                           Expanded(child: InkWell(
                             onTap: (){
                               Provider.of<ThemeProvider>(context,listen: false).changelan(true);
                             },
                             child: Container(
                               height: 29.17,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color:ar?ColorManager.greenColor: ColorManager.grayLanColor,
                               ),
                               child:Text("E",style: TextStyle(
                                   fontWeight:ar? FontWeight.bold:FontWeight.w500,
                                   color:ar? ColorManager.whiteColor:ColorManager.blackColor,
                                   fontSize: 20
                               )),
                             ),
                           )),
                           Expanded(child: InkWell(
                             onTap: (){
                               Provider.of<ThemeProvider>(context,listen: false).changelan(false);                             },
                             child: Container(
                               height: 29.17,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color:!ar?ColorManager.greenColor: ColorManager.grayLanColor,
                               ),
                               child:Text("ع",
                                   style: TextStyle(
                                   fontWeight:!ar? FontWeight.bold:FontWeight.w500,
                                   fontFamily: 'Cairo',
                                   color:!ar? ColorManager.whiteColor:ColorManager.blackColor,
                                   fontSize: 16
                               )),
                             ),
                           )),
                         ],
                       ),
                     ),

                  ],
                ),
              ),
              const  SizedBox(
                height: 25,
              ),
              Container(
                width: 359,
                height: 76,
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: ColorManager.dlcon(context),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        name:AppStringsDir.Nightmode(context),
                        alignmentGeometry: Alignment.center,
                        color: ColorManager.blacktowhite(context),
                        fontWeight: FontWeight.w500,
                        font: 20),
                    Container(
                      width: 96,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorManager.backtograylan(context),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [

                          Expanded(child: InkWell(
                            onTap: (){
                              Provider.of<SettingMode>(context,listen: false).changedarkmode(true);
                              Provider.of<ThemeProvider>(context,listen: false).toggleTheme(true);
                            },
                            child: Container(
                              height: 29.17,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:darkmode?ColorManager.greenColor: ColorManager.grayLanColor,
                              ),
                              child:Image.asset("assets/icons/night.png",height: 22,width: 24,color:darkmode?ColorManager.whiteColor: ColorManager.blackColor, ),

                            ),
                          )),
                          Expanded(child: InkWell(
                            onTap: (){
                              Provider.of<ThemeProvider>(context,listen: false).toggleTheme(false);
                              Provider.of<SettingMode>(context,listen: false).changedarkmode(false);
                            },
                            child: Container(
                              height: 29.17,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:!darkmode?ColorManager.greenColor: ColorManager.grayLanColor,
                              ),
                              child:Image.asset("assets/icons/sun.png",color:!darkmode?ColorManager.whiteColor: ColorManager.blackColor, ),
                            ),
                          )),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

