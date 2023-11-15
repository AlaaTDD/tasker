import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/need_bloc.dart';
import 'package:tasker/customs/share_per.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:flutter/material.dart';
import '../../admin/main_screen_admin/mainscreen.dart';
import '../../customs/custom_bottom.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_text_field.dart';
import '../main_screen/mainscreen.dart';

class NewPassScreen extends StatelessWidget {
   NewPassScreen({super.key,});
   TextEditingController pass=TextEditingController();
   TextEditingController passconfirm=TextEditingController();
 GlobalKey<FormState>globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      builder: (BuildContext context, state) {
      return Scaffold(
        body: Form(
          key: globalKey,
          child: Center(
            child: Directionality(
              textDirection: AppStringsDir.textDirection(context),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        name: AppStringsDir.Newpass(context),
                        alignmentGeometry: Alignment.center,
                        color: ColorManager.greentowhite(context),
                        fontWeight: FontWeight.w500,
                        font: 24,
                      ),
                      const SizedBox(height: 60,),
                      CustomText(
                        name: AppStringsDir.textpass(context),
                        alignmentGeometry: Alignment.center,
                        color: ColorManager.blacktowhite(context),
                        fontWeight: FontWeight.w300,
                        font: 16,
                      ),
                      const SizedBox(height: 50,),
                      CustomTextFormFeld(
                        textInputType: TextInputType.text,
                        isStwich: false,
                        i: 10,
                        ii: 327,
                        controller: pass,
                        color: ColorManager.blackColor.withOpacity(0.2),
                        colorr: ColorManager.blackColor.withOpacity(0.2),
                        icon: Icons.lock,
                        suficon: Icons.remove_red_eye,
                        hinttext:  AppStringsDir.pass(context),),
                      SizedBox(height: 15,),
                      CustomTextFormFeld(
                        ii: 327,
                        textInputType: TextInputType.text,
                        isStwich: false,
                        i: 10,
                        controller: passconfirm,
                        suficon: Icons.remove_red_eye,
                        color: ColorManager.blackColor.withOpacity(0.2),
                        colorr: ColorManager.blackColor.withOpacity(0.2),
                        icon: Icons.lock,
                        hinttext:  AppStringsDir.confirmpassword(context),),
                      SizedBox(height: 80,),
                      Align(
                          alignment: Alignment.center,
                          child: CustomBottonB(
                            name:  AppStringsDir.next(context),
                            onPressed: () {
                              if(globalKey.currentState!.validate()){
                                if(pass.text==passconfirm.text){
                                 AuthCubit.get(context).changePassLoged(pass.text);
                                }else{
                                  NeedBloc.showshowSnackBar("كلمة السر غير متشابهة");
                                }
                              }
                            },
                            height: 61,
                            width: 327,
                            color: ColorManager.redColor,
                            colorr: ColorManager.whiteColor,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }, listener: (BuildContext context, Object? state)async {
          if(state is updateSuccessState){
           await SharePer.saveData("token", state.token);
             NeedBloc.showshowSnackBar("تم تغيير كلمة السر");
             pass.clear();
             passconfirm.clear();
             if(state.role=="admin"){
               navigatToandfinish(context, MainscreenAdmin());
             }else{
               navigatToandfinish(context, Mainscreen());
             }

          }
    },);
  }
}
