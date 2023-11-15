import 'package:tasker/bloc/auth/auth_cubit.dart';
import 'package:tasker/customs/custom_bottom.dart';
import 'package:tasker/customs/custom_checkbox.dart';
import 'package:tasker/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../customs/constants.dart';
import '../resources/color_management.dart';
import 'package:url_launcher/url_launcher.dart';
import '../resources/string_manager.dart';
import 'custom_text.dart';

class NeedBloc{
  static  showshowSnackBar(String msg) =>
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 6,
          backgroundColor: ColorManager.greenColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
  static launchFaceBook(String text) async {
    String url = text;
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url))
        : print("fault");
  }
  static Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      text: 'أُسْتاذيّ',
      linkUrl: 'https://play.google.com/store/apps/details?id=com.cookalaaapp.cookalaaapp',
      chooserTitle: 'Example Chooser Title',
    );
  }
  static Future launchWhatsapp(number, message) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url))
        : print("fault");
  }
  static showDelogLogin(BuildContext context,) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.transparent,
          contentPadding: EdgeInsets.all(0),
          content: Container(
            height: 500,
            width: 340,
           decoration: BoxDecoration(
             color: Theme.of(context).scaffoldBackgroundColor,
             borderRadius: BorderRadius.circular(15)
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              Image.asset("assets/images/done.png"),
               CustomText(
                 name: AppStringsDir.Congratulations(context),
                 alignmentGeometry: Alignment.center,
                 color: ColorManager.blacktowhite(context),
                 fontWeight: FontWeight.w400,
                 font: 32,
               ),
               const SizedBox(height: 20),
               CustomText(
                 name: AppStringsDir.goahead(context),
                 alignmentGeometry: Alignment.center,
                 color:  ColorManager.blacktowhite(context),
                 fontWeight: FontWeight.w400,
                 font: 16,
               ),
             ],
           ),
          ),
        );
      },
    );
  }
  static showDelogTask(BuildContext context, GestureTapCallback onPressed) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.transparent,
          contentPadding: EdgeInsets.all(0),
          content: Container(
            height: 500,
            width: 340,
            decoration: BoxDecoration(
                color:Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/done.png"),
                const SizedBox(height: 10),
                CustomText(
                  name: AppStringsDir.Yourrating(context),
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w400,
                  font: 32,
                ),
                const SizedBox(height: 30),
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 35,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: ColorManager.starColor,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
              ],
            ),
          ),
        );
      },
    );
  }
  static showDelogSendTask(BuildContext context,String name, GestureTapCallback onPressed) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.transparent,
          contentPadding: EdgeInsets.all(0),
          content: Container(
            height: 500,
            width: 340,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/done.png"),
                const SizedBox(height: 10),
                CustomText(
                  name: AppStringsDir.Congratulations(context),
                  alignmentGeometry: Alignment.center,
                  color:  ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w400,
                  font: 32,
                ),
                const SizedBox(height: 5),
                CustomText(
                  name: name,
                  alignmentGeometry: Alignment.center,
                  color:  ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w400,
                  font: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  static showDelogLogOut(BuildContext context, GestureTapCallback onPressed) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor:Colors.transparent,
          contentPadding: EdgeInsets.all(0),
          content: Container(
            height: 200,
            width: 346,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  name: AppStringsDir.LogoutofTasker(context),
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.greenColor,
                  fontWeight: FontWeight.w600,
                  font: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0,bottom: 10,top: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          name: AppStringsDir.Rememberme(context),
                          alignmentGeometry: Alignment.center,
                          color: ColorManager.blacktowhite(context),
                          fontWeight: FontWeight.w500,
                          font: 14,
                        ),
                        CheckboxCustom(),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CustomBotton(colorr: ColorManager.whiteColor,color: ColorManager.greenColor,name: AppStringsDir.signout(context), onPressed: (){
                    AuthCubit.get(context).removeData(context);
                  }, height: 38.36, width: 325),
                ),
                 SizedBox(height: 10,),
                CustomText(
                  name: AppStringsDir.cancellation(context),
                  onPressed: (){
                    navigatToback(context);
                  },
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.blacktowhite(context),
                  fontWeight: FontWeight.w400,
                  font: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}