import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_outlinebottom.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/screens/completed_tasks/history_date_task.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../resources/string_manager.dart';

class HistoryTaskes extends StatefulWidget {
  const HistoryTaskes({super.key});
  @override
  State<HistoryTaskes> createState() => _HistoryTaskesState();
}
class _HistoryTaskesState extends State<HistoryTaskes> {
  late List<_ChartData> data = [
    _ChartData('', 9,color: ColorManager.chart2),
    _ChartData('', 4,color: ColorManager.chart3),
    _ChartData('', 87,color: ColorManager.chart1),
  ];
  late TooltipBehavior  _tooltip=TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: AppStringsDir.Historyoftasks(context),
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                height: 255,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SfCircularChart(
                        tooltipBehavior: _tooltip,
                        series: [
                          DoughnutSeries<_ChartData, String>(
                              dataSource: data,
                              radius: "95",
                              innerRadius: "70",
                              pointColorMapper: (_ChartData data, _) => data.color,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold')
                        ]),
                    CustomTextPoppins(name: "87%", fontWeight: FontWeight.bold, font: 30)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 BuildRow(ColorManager.chart3,AppStringsDir.finished(context)),
                BuildRow(ColorManager.chart2,AppStringsDir.inprogress(context)),
                BuildRow(ColorManager.chart1,AppStringsDir.Unfinished(context)),
              ],),
              const SizedBox(height: 35),
              CustomText(alignmentGeometry: AppStringsDir.rtl(context),name:AppStringsDir.Annualstatistics(context),
                  fontWeight: FontWeight.w600, color: ColorManager.blacktowhite(context).withOpacity(0.7), font: 16),

              Container(
                height: 150,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0), // Remove major grid lines
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0), // Remove major grid lines
                  ),
                  legend: Legend(isVisible: false),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <SplineSeries<SalesData, String>>[
                    SplineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40),
                        SalesData('Jun', 30),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.month,
                      yValueMapper: (SalesData sales, _) => sales.sales,

                      color: ColorManager.chart1,
                    ),
                    SplineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('Jan', 20),
                        SalesData('Feb', 25),
                        SalesData('Mar', 30),
                        SalesData('Apr', 28),
                        SalesData('May', 35),
                        SalesData('Jun', 20),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.month,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      color: ColorManager.chart2,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  BuildRow(ColorManager.chart2,AppStringsDir.Assignedtasks(context)),
                  SizedBox(width: 20,),
                  BuildRow(ColorManager.chart1,AppStringsDir.Completed(context)),
                ],),
              const SizedBox(height: 40),
              Card(
                elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: CustomOutLineBottom(name:  AppStringsDir.Recordtaskhistory(context), onPressed: (){
                    navigatTo(context, HistoryDateTask());
                  }, color: ColorManager.greenColor,width:323 ,height: 40,)),

            ],
          ),
        ));
  }

 Widget BuildRow(Color color,String name) {
    return Row(children: [
      CustomText(name:name,
          fontWeight: FontWeight.w600,font: 10),
      SizedBox(width: 10,),
      CircleAvatar(
        radius: 5,
        backgroundColor:color,
      ),
    ],);
 }
}

class _ChartData {
  _ChartData(this.x, this.y,{required this.color});
  final String x;
  final double y;
  final Color color;
}
class SalesData {
  final String month;
  final double sales;
  SalesData(this.month, this.sales);
}