import 'package:tasker/admin/management_tasks/manage_tasks.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_outlinebottom.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/models/model_mission.dart';
import 'package:tasker/provider/switch_screen.dart';
import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/resources/string_manager.dart';
import '../../provider/switchscreenmode.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});
  @override
  Widget build(BuildContext context) {
    final switchScreen=Provider.of<SwitchScreenMode>(context).switchscreen;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<SwitchMainScreen>(context,listen: false).ChangeScreen(false);
                    },
                  child: Container(
                      height: 47,
                      width: 50,
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
                        Icons.chat_bubble,
                        color: ColorManager.whiteColor,
                        size: 25,
                      )),
                ),
                CustomText(
                    name: AppStringsDir.welcome(context),
                    color: ColorManager.greenColor,
                    fontWeight: FontWeight.bold,
                    font: 24),
              ],
            ),
           const SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomOutLineBottom(
                        height: 44,
                        width: 110,
                        name: AppStringsDir.statistics(context),
                        onPressed: () {
                          Provider.of<SwitchScreenMode>(context,listen: false).changeswitchscreen(false);
                        },
                        color: !switchScreen?ColorManager.greenColor:ColorManager.grayColor),
                    SizedBox(width: 20,),
                    CustomOutLineBottom(
                        height: 44,
                        width: 110,
                        name: AppStringsDir.Overview(context),
                        onPressed: () {
                          Provider.of<SwitchScreenMode>(context,listen: false).changeswitchscreen(true);
                        },
                        color:switchScreen?ColorManager.greenColor:ColorManager.grayColor ),
                  ],
                )),

            if(switchScreen)...[
              const SizedBox(
                height: 80,
              ),
              MissionBuild(AppStringsDir.Systemsandoperation(context),"25",ColorManager.greenColor,ColorManager.greenColor1,() {
                navigatTo(context, manageTasks());
              },context),
              const SizedBox(
                height: 30,
              ),
              MissionBuild(AppStringsDir.Digitaltransformation(context),"16",ColorManager.btnColor,ColorManager.btnColor1,() {
                navigatTo(context, manageTasks());
              },context),
              const SizedBox(
                height: 30,
              ),
              MissionBuild(AppStringsDir.Infrastructure(context),"37",ColorManager.btnColor2,ColorManager.btnColor3.withOpacity(0.7),() {
                navigatTo(context, manageTasks());
              },context),
            ]else...[
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 171.29,
                  width: 255,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomText(
                            name: AppStringsDir.Completedtasksforthismonth(context),
                            color: ColorManager.blacktowhite(context),
                            fontWeight: FontWeight.w600,
                            alignmentGeometry:AppStringsDir.rtl(context),
                            font: 13),
                      ),
                      Expanded(
                        child: CustomPaint(
                          size: Size(350, 350), // Adjust the size as needed
                          painter: SemiCircleChartBorderPainter(
                              num:10468,
                              text: AppStringsDir.task(context),
                              color: ColorManager.blacktowhite(context),
                              allnum: 25000),
                        ),
                      ),
                     const  SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 292,
                  width: 278,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomText(
                            name: AppStringsDir.tasks(context),
                            color: ColorManager.blacktowhite(context),
                            fontWeight: FontWeight.w600,
                            alignmentGeometry: Alignment.centerLeft,
                            font: 17),
                      ),
                      Expanded(child: Container(
                        child: ListView.builder(
                          itemCount: Tasks.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                           return Padding(
                             padding: EdgeInsets.only(left: 20),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Container(
                                   width:31,
                                   height: Tasks[index]["main"],
                                   decoration: BoxDecoration(
                                     color: ColorManager.grayColor,
                                     borderRadius: const BorderRadius.only(
                                       topLeft: Radius.circular(10),
                                       topRight: Radius.circular(10)
                                     )
                                   ),
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                     child: Container(
                                       height: Tasks[index]["second"],
                                       width: 31,
                                       decoration: BoxDecoration(
                                           color: ColorManager.greenColor,
                                         borderRadius: const BorderRadius.only(
                                             topLeft: Radius.circular(10),
                                             topRight: Radius.circular(10)
                                         )
                                       ),
                                     ),
                                   ),
                                 ),
                                 CustomText(
                                     name: Tasks[index]["text"],
                                     color: ColorManager.blackColor.withOpacity(0.3),
                                     fontWeight: FontWeight.w600,
                                     font: 10),
                               ],
                             ),
                           );
                          },),
                      )),
                      Buildlisttitle(AppStringsDir.Digitaltransformation(context), "245", "assets/icons/11.png", ColorManager.listtitle1, ColorManager.listtitle1.withOpacity(0.3),context),
                      Buildlisttitle(AppStringsDir.Infrastructure(context), "122", "assets/icons/22.png",  ColorManager.listtitle2, ColorManager.listtitle2.withOpacity(0.3),context),
                    ],
                  ),
                ),
              ),
            ],

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
            Column(
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
            Expanded(
                child: CustomText(
                    alignmentGeometry: Alignment.centerRight,
                    name: text,
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.w500,
                    font: 24)),
          ],
        ),
      ),
    );
  }
  Widget Buildlisttitle(String text,String num,String image,Color color,Color color2,BuildContext context){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading:Container(
            height: 29.78,
            width: 37.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      color,
                      color2,
                    ])),
            child: Image.asset(image,color: ColorManager.blackColor,)),
        title: CustomText(name: text, fontWeight: FontWeight.w600,alignmentGeometry: AppStringsDir.rtl(context), font: 13),
            trailing: CustomText(name: num, fontWeight: FontWeight.w600, font: 13), 
      ),
    );
  }
}


class SemiCircleChartBorderPainter extends CustomPainter {
  final double num;
  final double allnum;
  final Color color;
  final String text;
  SemiCircleChartBorderPainter({required this.num,
    required this.allnum,
    required this.text,
    required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 3;

    final paint = Paint()
      ..color = ColorManager.RedRate
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0..maskFilter = MaskFilter.blur(BlurStyle.normal, 1.0);

    final paint1 = Paint()
      ..color = ColorManager.grayColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;
    double percentage = (num / allnum) * 100;
    final sweepAngle = -(100 / 100) * 3.14; // Calculate the sweep angle based on the percentage
    final sweepAngle1 = -((100 - percentage) / 100) * 3.14;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      sweepAngle,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      sweepAngle1,
      false,
      paint1,
    );

    // Create a TextPainter to layout and draw the text
    final textSpan = TextSpan(
      children: [
        TextSpan(
          text: '$num\n',
          style: TextStyle(fontSize: 20, color: color,fontWeight: FontWeight.w500),
        ),

        TextSpan(
          text: '        ${text}',
          style: TextStyle(fontSize: 13, color:  ColorManager.grayColor,fontWeight: FontWeight.w600),
        ),
      ],
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final textWidth = textPainter.width;
    final textHeight = textPainter.height;
    final textX = size.width / 2 - textWidth / 2;
    final textY = size.height - textHeight+10;

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}