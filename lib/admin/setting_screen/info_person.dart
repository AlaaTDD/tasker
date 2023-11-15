import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:flutter/material.dart';
import 'package:tasker/resources/string_manager.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_text_field.dart';

class Infoperson extends StatelessWidget {
  Infoperson({super.key});
  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    name.text=AuthCubit.get(context).userData.name.toString();
    email.text=AuthCubit.get(context).userData.email.toString();
    pass.text="1234567";
    return Scaffold(
      body: Directionality(
        textDirection: AppStringsDir.textDirection(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 36,
                      ),
                  CustomText(
                      name: AppStringsDir.Mypersonalinformation(context),
                      alignmentGeometry: Alignment.center,
                      color: ColorManager.greenColor,
                      fontWeight: FontWeight.w500,
                      font: 20),
                 InkWell(
                        onTap: () {
                          navigatToback(context);
                        },
                        child: Container(
                            height: 36,
                            width: 36,
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
                              Icons.arrow_forward_rounded,
                              color: ColorManager.whiteColor,
                              size: 17,
                            )),
                      ),

                ]),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: ColorManager.personColor,
                child: Image.asset("assets/icons/Profile.png",
                    color: ColorManager.blackColor,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                  name: AuthCubit.get(context).userData.name.toString(),
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w500,
                  font: 18),
              SizedBox(
                height: 5,
              ),
              Image.asset("assets/images/Line 16.png"),
              SizedBox(
                height: 25,
              ),
              CustomTextFormFeld(
                ii: 327,
                textInputType: TextInputType.text,
                isStwich: false,
                i: 10,
                controller: name,
                color: ColorManager.blackColor.withOpacity(0.2),
                colorr: ColorManager.blackColor,
                icon: Icons.person,
                hinttext: AppStringsDir.name(context),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormFeld(
                ii: 327,
                textInputType: TextInputType.text,
                isStwich: false,
                i: 10,
                controller: email,
                color: ColorManager.blackColor.withOpacity(0.2),
                colorr: ColorManager.blackColor,
                icon: Icons.email,
                hinttext: AppStringsDir.email(context),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormFeld(
                ii: 327,
                textInputType: TextInputType.text,
                isStwich: false,
                i: 10,
                controller: pass,
                suficon: Icons.remove_red_eye,
                color: ColorManager.blackColor.withOpacity(0.2),
                colorr: ColorManager.blackColor,
                icon: Icons.lock,
                hinttext: AppStringsDir.pass(context),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
