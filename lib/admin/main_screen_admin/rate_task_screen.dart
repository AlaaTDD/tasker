import 'package:tasker/admin/confirm_task/confirm_task.dart';
import 'package:tasker/bloc/subtask/subtask_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';
import 'package:tasker/resources/string_manager.dart';

class RateTaskScreen extends StatelessWidget {
  const RateTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70,),
           CustomText(name: AppStringsDir.Assessingtasks(context), fontWeight: FontWeight.bold, font: 24,color: ColorManager.greenColor,alignmentGeometry: AppStringsDir.rtl(context),),
            const SizedBox(height: 50,),
            Image.asset("assets/images/Line 16.png"),
            const SizedBox(height: 20,),
            Container(
              width: 350,
              child: FutureBuilder(
                  future: SubtaskCubit.get(context).getTask(),
                  builder: (context,snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final data=snapshot.data!.data[index];
                          return buildContainer(data.title,() {
                            navigatTo(context, ConfirmTask(datumSub: data,));
                          },context);
                        },);
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget buildContainer(String text,GestureTapCallback callback,BuildContext context){
    return InkWell(
      onTap: callback,
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 10),
        child: Card(
          elevation: 2,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(5),
           ),
            child: Container(
              height: 40.11,
          width: 283.85,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: ColorManager.dlcon(context),
            borderRadius: BorderRadius.circular(5),
          ),
              child: CustomTextPoppins(name: text, fontWeight: FontWeight.w600, font: 14,color: ColorManager.blacktowhite(context),alignmentGeometry: Alignment.centerLeft,),
        )),
      ),
    );
  }
}
