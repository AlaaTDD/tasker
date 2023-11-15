import 'package:provider/provider.dart';
import 'package:tasker/admin/management_tasks/add_tasks.dart';
import 'package:tasker/admin/management_tasks/edit_taskes.dart';
import 'package:tasker/admin/management_tasks/follow_taskes.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../customs/constants.dart';
import '../../customs/custom_text.dart';
import '../../provider/menu_mode.dart';
import '../../resources/color_management.dart';


class manageTasks extends StatelessWidget {
  const manageTasks({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomWidget(text: AppStringsDir.tasks(context), widget: Column(
      children: [
        const SizedBox(height: 120),
        MissionBuild(AppStringsDir.add(context),ColorManager.greenColor,ColorManager.greenColor1, () {
          navigatTo(context, AddTaskes());
          Provider.of<MenuMode>(context,listen: false).chagetosearch(context);
        }),
        MissionBuild(AppStringsDir.follow(context),ColorManager.btnColor,ColorManager.btnColor1,() {
          navigatTo(context, FollowTaskes());
        }),

      ],
    ));
  }
  Widget MissionBuild(String text,Color color,Color color1,GestureTapCallback callback){
    return  GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 93,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color,
                    color1,
                  ])),
          child: CustomText(
              alignmentGeometry: Alignment.center,
              name: text,
              color: ColorManager.whiteColor,
              fontWeight: FontWeight.w500,
              font: 24),
        ),
      ),
    );
  }

}
