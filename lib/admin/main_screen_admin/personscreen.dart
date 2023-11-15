import 'package:tasker/admin/setting_screen/info_person.dart';
import 'package:tasker/admin/setting_screen/setting_app.dart';
import 'package:tasker/customs/constants.dart';
import 'package:flutter/material.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../customs/custom_text.dart';
import '../../customs/need_bloc.dart';
import '../../resources/color_management.dart';
import '../../resources/string_manager.dart';
import '../../screens/auth_screen/newpass_screen.dart';

class PersonScreenAdmin extends StatelessWidget {
  const PersonScreenAdmin({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppStringsDir.textDirection(context),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              CustomText(
                  name: AppStringsDir.Profilepersonly(context),
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w500,
                  font: 18),
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 40,
                backgroundColor: ColorManager.personColor,
                child: Image.asset("assets/icons/iconper1.png",color: ColorManager.blackColor,height: 40,width: 40,fit: BoxFit.fill),
              ),
              SizedBox(height: 20,),
              CustomText(
                  name:  AuthCubit.get(context).userData.name.toString(),
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w500,
                  font: 18),
              SizedBox(height: 30,),
              Image.asset("assets/images/Line 16.png"),
              SizedBox(height: 40,),
              BuildListTitle(AppStringsDir.Mypersonalinformation(context), "assets/icons/iconper2.png",(){
                navigatTo(context, Infoperson());
              },context),
              SizedBox(height: 30,),
              BuildListTitle(AppStringsDir.changepass(context), "assets/icons/iconper3.png",(){
                navigatTo(context, NewPassScreen());
              },context),
              SizedBox(height: 30,),
              BuildListTitle(AppStringsDir.Applicationsettings(context), "assets/icons/iconsper5.png",(){
                navigatTo(context, SettingApp());

              },context),
              SizedBox(height: 30,),
              BuildListTitle(AppStringsDir.signout(context), "assets/icons/iconper4.png",(){
                NeedBloc.showDelogLogOut(context, () { });
              },context),
            ],
          ),
        ),
      ),
    );
  }
  Widget BuildListTitle(String name,String image,GestureTapCallback callback,BuildContext context){
    return ListTile(
      onTap:callback ,
      leading: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          height:50 ,
          width: 56,
          child: Image.asset(image,color: ColorManager.blacktowhite(context),),
        ),
      ),
      title:Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: CustomText(
            name: name,
            color: ColorManager.blacktowhite(context),
            fontWeight: FontWeight.w500,
            font: 16),
      ),
      trailing: RotatedBox(
          quarterTurns: AppStringsDir.rotate(context),
          child: Image.asset("assets/icons/Vector.png",color: ColorManager.blacktowhite(context),)),
    );
  }
}
