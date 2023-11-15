import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/calendar/calendar_cubit.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/provider/get_days.dart';
import 'package:tasker/provider/time_mode.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/crasur_screen.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:provider/provider.dart';
import 'package:tasker/widgets/skeletons_widget.dart';

class HijriCalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final month1=Provider.of<GetDays>(context).month;
    HijriCalendar.setLocal(AppStringsDir.entar(context)); // Set the calendar to use Arabic locale
    HijriCalendar hijriDate = HijriCalendar.now();
    int months=hijriDate.getDaysInMonth(hijriDate.hYear, month1);
    List<String> hijriMonths = [];
    hijriDate.hMonth = 1;
    for (int month = 1; month <= 12; month++) {
      hijriMonths.add(hijriDate.toFormat("MMMM"));
      print(hijriDate.toFormat("MMMM"));
      hijriDate.hMonth = month + 1;
    }
    final time=Provider.of<TimeMode>(context).name;
    return BlocConsumer<CalendarCubit,CalendarState>(
      builder: (BuildContext context, state) {
      return ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 30),
          CruserScreen(text: hijriMonths),
          Container(
            height: 86,
            child: ListView.builder(
              itemCount: months,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Provider.of<TimeMode>(context,listen: false).ChangeName(index.toString());
                    Provider.of<GetDays>(context,listen: false).dateGregorian(hijriDate.hYear,month1,index+1);
                  },

                  child: Container(
                    height: 86,
                    width: 53.9,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              if(time==index.toString())...[
                                ColorManager.greenColor3,
                                ColorManager.greenColor4,
                              ]else...[
                                ColorManager.dlcon(context),
                                ColorManager.dlcon(context)
                              ],

                            ])
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        CustomText(alignmentGeometry: Alignment.bottomCenter,name: Provider.of<GetDays>(context).GetDay(month1, index+1,context), fontWeight: FontWeight.w600,color:time==index.toString()?ColorManager.grayColor.withOpacity(0.7):ColorManager.blacktowhite(context).withOpacity(0.7), font: 10),
                        Expanded(child: CustomText(height: 17,alignmentGeometry: Alignment.topCenter,name: (index+1).toString(), fontWeight: FontWeight.w700,color:time==index.toString()?ColorManager.whiteColor: ColorManager.blacktowhite(context).withOpacity(0.7), font: 16)),
                      ],
                    ),
                  ),
                );
              },),
          ),
          const SizedBox(height: 20),
          Image.asset("assets/images/Line 16.png"),
          const SizedBox(height: 10),
          FutureBuilder(
            future:CalendarCubit.get(context).getCalender(Provider.of<GetDays>(context,listen: false).dategregorian),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int indexx) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                           onTap: (){

                           },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(height: 17,alignmentGeometry: Alignment.bottomCenter,name: "08", fontWeight: FontWeight.w600,color: ColorManager.blacktowhite(context).withOpacity(0.7), font: 14),
                                CustomText(height: 17,alignmentGeometry: Alignment.topCenter,name: "AM", fontWeight: FontWeight.w600, font: 14,color: ColorManager.blacktowhite(context).withOpacity(0.7)),
                              ],
                            ),
                          ),
                          SizedBox(width:20 ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 40.11,
                                width: 284.75,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        if(indexx==0)...[
                                          ColorManager.greenColor2,
                                          ColorManager.greenColor2.withOpacity(0.7)
                                        ]else...[
                                          ColorManager.dlcon(context),
                                          ColorManager.dlcon(context),
                                        ],
                                      ]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Column(
                                    children: [
                                      Expanded(child: CustomText(alignmentGeometry: Alignment.centerLeft,name:snapshot.data!.data[indexx].taskId!.title.toString(), fontWeight: FontWeight.w500, font: 14,color:indexx==0?ColorManager.whiteColor:ColorManager.blacktowhite(context).withOpacity(0.7) ,)),
                                      CustomText(name: "08:00 - 11:00 am",alignmentGeometry: Alignment.centerLeft, fontWeight: FontWeight.w500, font: 10,color: indexx==0?ColorManager.whiteColor:ColorManager.blacktowhite(context).withOpacity(0.7)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },);
              }else{
                return SkeletonsWidget(index: 5,);
              }
            },

          )
        ],
      );
    }, listener: (BuildContext context, Object? state) {

    },);
  }

}