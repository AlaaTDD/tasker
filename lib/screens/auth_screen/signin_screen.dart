import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_text_field.dart';
import 'package:tasker/customs/need_bloc.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/resources/string_manager.dart';
import 'package:tasker/screens/auth_screen/changepassword_screen.dart';
import 'package:tasker/screens/main_screen/mainscreen.dart';
import 'package:tasker/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import '../../admin/main_screen_admin/mainscreen.dart';
import '../../customs/custom_bottom.dart';
import '../../customs/custom_text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(builder: (BuildContext context, state) {
      return Directionality(
        textDirection: AppStringsDir.textDirection(context),
        child: Scaffold(
          body: Form(
            key: globalKey,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: 120,
                            width: 200,
                            alignment: Alignment.center,
                            child: ImageLogo(context)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        name: AppStringsDir.login(context),
                        alignmentGeometry: Alignment.center,
                        color: ColorManager.blacktowhite(context),
                        fontWeight: FontWeight.w300,
                        font: 22,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        name: AppStringsDir.WelcometoTasker(context),
                        alignmentGeometry: Alignment.center,
                        color: ColorManager.blacktowhite(context).withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        font: 16,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height(context) - 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: ColorManager.greenColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        CustomTextFormFeld(
                          ii: 302,
                          textInputType: TextInputType.text,
                          isStwich: false,
                          i: 10,
                          controller: email,
                          color: ColorManager.blackColor,
                          colorr: ColorManager.blackColor,
                          icon: Icons.email,
                          hinttext: AppStringsDir.email(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormFeld(
                          ii: 302,
                          textInputType: TextInputType.text,
                          isStwich: false,
                          i: 10,
                          controller: pass,
                          suficon: Icons.remove_red_eye,
                          color: ColorManager.blackColor,
                          colorr: ColorManager.blackColor,
                          icon: Icons.lock,
                          hinttext: AppStringsDir.pass(context),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          name: AppStringsDir.forgetpass(context),
                          width: 302,
                          onPressed: () {
                            navigatTo(context, ChangeScreen());
                          },
                          alignmentGeometry: Alignment.centerLeft,
                          color: ColorManager.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w300,
                          font: 14,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: CustomBotton(
                              name: AppStringsDir.login(context),
                              onPressed: () async {
                                if (globalKey.currentState!.validate()) {
                                AuthCubit.get(context).Login(email.text, pass.text, context);
                                }
                              },
                              height: 61,
                              width: 302,
                              color: ColorManager.redColor,
                              colorr: ColorManager.whiteColor,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (BuildContext context, Object? state) {
          if(state is  SigninLoadingState){
            NeedBloc.showDelogLogin(context);
          }
      if(state is SigninSuccessState){
           AuthCubit.get(context).saveData(state.name, state.phone, state.email, state.token,state.role);
           AuthCubit.get(context).addDataa(state.name, state.email, state.phone);

           if(state.role=="admin"){
             navigatToandfinish(context, MainscreenAdmin());
           }else{
             navigatToandfinish(context, Mainscreen());
           }
          }
    },);
  }
}
