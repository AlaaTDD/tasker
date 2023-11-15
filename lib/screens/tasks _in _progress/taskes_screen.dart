import 'package:tasker/bloc/task/taskcubit_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/screens/tasks%20_in%20_progress/details_taskes.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class MyTaskesScreen extends StatelessWidget {
  MyTaskesScreen({super.key});
  List<Map<String,dynamic>>list=[
    {
      "text":"User Interface",
      "date":"3 days",
      "status":"heih",
    },
    {
      "text":"Marketing Page Redesign",
      "date":"9h 30m",
      "status":"mid",
    },
    {
      "text":"New iOS Developement",
      "date":"2 months",
      "status":"down",
    },
    {
      "text":"UI\\UX",
      "date":"7 days",
      "status":"heih",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: AppStringsDir.Mytasks(context),
        widget: Column(
      children: [
       const SizedBox(
          height: 80,
        ),
       Container(
         width: 350,
         child: FutureBuilder(
           future: TaskCubit.get(context).getTask(),
           builder: (context,snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final data=snapshot.data!.data[index];
                  return GestureDetector(
                    onTap: (){
                     navigatTo(context, DetailsTaskes(datum: data));
                    },
                    child: Container(
                      height: 72,
                      padding:const EdgeInsets.all(10),
                      margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                        color: ColorManager.dlcon(context),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 15,),
                              CustomTextPoppins(name: TaskCubit.get(context).TimeTask(data.startDate, data.dueDate), fontWeight: FontWeight.w600, font: 14),
                              SizedBox(width: 15,),
                              Image.asset("assets/icons/his2.png",color: ColorManager.greenColor,),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(name: data.title, fontWeight: FontWeight.w600, font: 13),
                                SizedBox(width: 15,),
                                Image.asset("assets/icons/his1.png",color: ColorManager.greenColor,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },);
            }else{
              return Center(child: CircularProgressIndicator());
            }
           }
         ),
       )
      ],
    ));
  }
}
