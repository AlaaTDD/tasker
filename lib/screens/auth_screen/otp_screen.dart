import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/need_bloc.dart';
import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/screens/auth_screen/newpass_screen.dart';
import 'package:tasker/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../customs/constants.dart';
import '../../customs/custom_bottom.dart';
import '../../customs/custom_text.dart';
import '../../resources/color_management.dart';
import '../../resources/string_manager.dart';

class otpScreen extends StatelessWidget {
  final String phone;
   otpScreen({super.key,required this.phone});
   TextEditingController otp=TextEditingController();
   @override
  Widget build(BuildContext context) {
   return BlocConsumer<AuthCubit,AuthState>(builder: (BuildContext context, state) {
     return Scaffold(
       body: ListView(
         shrinkWrap: true,
         physics:const NeverScrollableScrollPhysics(),
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
                   height: 90,
                 ),
                 CustomText(
                   name: AppStringsDir.changepass(context),
                   alignmentGeometry: Alignment.center,
                   color: ColorManager.blacktowhite(context).withOpacity(0.7),
                   fontWeight: FontWeight.w200,
                   font: 24,
                 ),
               ],
             ),
           ),
           Container(
             height: 684,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(50),
                 topRight: Radius.circular(50),
               ),
               color: ColorManager.greenColor,
             ),
             child: Directionality(
               textDirection: TextDirection.rtl,
               child: Container(
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         SizedBox(height: 50,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 35.0),
                           child: CustomText(
                             name: AppStringsDir.enteropt(context),
                             alignmentGeometry: AppStringsDir.rtl(context),
                             color: ColorManager.whiteColor,
                             fontFa: "Cairo",
                             fontWeight: FontWeight.w400,
                             font: 26,
                           ),
                         ),
                         SizedBox(height: 10,),
                         Padding(
                           padding: const EdgeInsets.only(right: 25.0),
                           child: CustomText(
                             name: AppStringsDir.textreceive(context),
                             alignmentGeometry:AppStringsDir.rtl(context),
                             color: ColorManager.whiteColor,
                             fontWeight: FontWeight.w100,
                             font: 16,
                           ),
                         ),
                         SizedBox(height: 50,),
                         Directionality(
                           textDirection: TextDirection.ltr,
                           child: PinCodeTextField(
                             appContext: context,
                             length: 4,
                             autoFocus: true ,
                             controller: otp,
                             cursorColor: ColorManager.blackColor,
                             keyboardType: TextInputType.number,
                             obscureText: false,
                             animationType: AnimationType.scale,
                             pinTheme: PinTheme(
                                 shape: PinCodeFieldShape.box,
                                 borderRadius: BorderRadius.circular(5),
                                 fieldHeight: 56,
                                 fieldWidth: 70,
                                 borderWidth: 1,
                                 activeFillColor:ColorManager.whiteColor.withOpacity(0.7),
                                 activeColor: ColorManager.blueColor,
                                 inactiveColor: ColorManager.greenColor,
                                 inactiveFillColor: ColorManager.whiteColor,
                                 selectedColor: ColorManager.greenColor,
                                 selectedFillColor: ColorManager.whiteColor
                             ),
                             animationDuration: Duration(milliseconds: 300),
                             backgroundColor: ColorManager.greenColor,
                             enableActiveFill: true,
                             onCompleted: (code){

                             },
                             onChanged: (value){
                             },
                           ),
                         ),

                         SizedBox(height: 40,),
                         Align(
                             alignment: Alignment.center,
                             child: CustomBottonB(
                               name: AppStringsDir.next(context),
                               onPressed: () {
                                 AuthCubit.get(context).verifyOtp(phone, otp.text);
                               },
                               height: 61,
                               width: 206,
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
         ],
       ),
     );
   }, listener: (BuildContext context, Object? state) {
      if(state is verifySuccessState){
        AuthCubit.get(context).saveData(state.name, state.phone, state.email, state.token,state.role);
        AuthCubit.get(context).addDataa(state.name, state.email, state.phone);
        navigatTo(context, NewPassScreen());
      }
      if(state is verifyErrorState){
        NeedBloc.showshowSnackBar("ادخل كود صحيح");
      }
   },);
  }
}
//alaa@gmail.com
//abeer@gmail.com