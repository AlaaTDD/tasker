import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_outlinebottom.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import '../../customs/custom_checkbox.dart';
import '../../customs/custom_text.dart';
import '../../resources/color_management.dart';

class ShowAllTaskes extends StatelessWidget {
   ShowAllTaskes({super.key});
  List<Map<String,dynamic>>list(BuildContext context)=>[
    {
      "text":"Task",
      "date":"Due",
    },{
      "text":AppStringsDir.Tasktitle(context),
      "date":AppStringsDir.date(context),
    }, {
      "text":"Example incomplete item",
      "date":"5 May 2022",
    },{
      "text":"Example complete item goes here",
      "date":"6 May 2022",
    },{
      "text":"Example complete item goes here",
      "date":"6 May 2022",
    },{
      "text":"Example incomplete item",
      "date":"7 May 2022",
    },{
      "text":"Example incomplete item",
      "date":"11 May 2022",
    },{
      "text":"Example incomplete item",
      "date":"19 May 2022",
    },{
      "text":"Example incomplete item",
      "date":"20 May 2022",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppStringsDir.textDirection(context),
      child: CustomWidget(
          text: AppStringsDir.Taskdetails(context),
          widget: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextPoppins(name:AppStringsDir.alltaskes(context), color: ColorManager.blacktowhite(context),fontWeight: FontWeight.w600, font: 20),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 285,
                child: ListView.builder(
                  itemCount: list(context).length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:ColorManager.dlcon(context),
                      ),
                      margin:EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          if(index==0)...[
                            SizedBox(width: 50,),
                          ]else...[
                            CheckboxCustomTask(),
                          ],
                          SizedBox(width: 10,),
                          Expanded(child: CustomText2(name:list(context)[index]["date"],color:ColorManager.blacktowhite(context).withOpacity(0.7) , fontWeight: FontWeight.w600, font: 14)),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 2,
                              child: CustomText2(name:list(context)[index]["text"],color:ColorManager.blacktowhite(context).withOpacity(0.7),alignmentGeometry: Alignment.centerLeft, fontWeight: FontWeight.w600, font: 14)),
                        ],
                      ),
                    );
                  },),
              ),

              const SizedBox(
                height: 30,
              ),
              CustomOutLineBottom(width: 126,height: 40,name: AppStringsDir.Addmore(context), onPressed: (){
                navigatToback(context);
              }, color: ColorManager.greenColor),
              const SizedBox(
                height: 30,
              ),
            ],
          )),
    );
  }
}
