import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/need_bloc.dart';
import 'package:tasker/screens/auth_screen/otp_screen.dart';
import 'package:tasker/widgets/image_logo.dart';
import 'package:country_code_picker_x/country_code_picker_x.dart';
import 'package:flutter/material.dart';
import '../../customs/constants.dart';
import '../../customs/custom_bottom.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_text_field.dart';
import '../../resources/color_management.dart';
import '../../resources/string_manager.dart';

class ChangeScreen extends StatelessWidget {
   ChangeScreen({super.key});
   TextEditingController phone=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<AuthCubit,AuthState>(
     builder: (BuildContext context, state) {
     return Directionality(
       textDirection: AppStringsDir.textDirection(context),
       child: Scaffold(
         body: ListView(
           shrinkWrap: true,
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
               height: 521,
               width: 390,
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
                     CustomText(
                       name: AppStringsDir.dontworry(context),
                       onPressed: () {
                         navigatTo(context, ChangeScreen());
                       },
                       alignmentGeometry: Alignment.centerLeft,
                       color: ColorManager.whiteColor,
                       fontWeight: FontWeight.w300,
                       font: 16,
                     ),
                     SizedBox(
                       height: 60,
                     ),
                     buildNumberPhone(),
                     SizedBox(
                       height: 40,
                     ),
                     Align(
                         alignment: Alignment.center,
                         child: CustomBottonB(
                           name: AppStringsDir.sendotp(context),
                           onPressed: () {
                            AuthCubit.get(context).Otp("+966${phone.text}");
                           },
                           height: 55,
                           width: width(context),
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
     );
   }, listener: (BuildContext context, Object? state) {
        if(state is otpSuccessState){
          navigatToandfinish(context, otpScreen(phone: "+966${phone.text}",));
          NeedBloc.showshowSnackBar(state.otp.toString());
        }
   },);
  }

  Widget buildNumberPhone() {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormFeld(
            ii: 302,
            textInputType: TextInputType.text,
            isStwich: false,
            i: 10,
            controller: phone,
            color: ColorManager.blackColor,
            colorr: ColorManager.blackColor,
            icon: Icons.phone,
            hinttext: "+966 66666 66666",
          ),
        ),
        SizedBox(width: 5,),
        Container(
          height: 58,
          decoration: BoxDecoration(
              color: ColorManager.mainColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: CountryCodePickerX(
            onChanged: print,
            initialSelection: 'SA',
            onInit: (val){
              print(val);
            },
            favorite: ['+966', 'SA'],
            backgroundColor: ColorManager.whiteColor,
            textStyle: TextStyle(
              color: ColorManager.blackColor.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
        ),
      ],
    );
  }
}
