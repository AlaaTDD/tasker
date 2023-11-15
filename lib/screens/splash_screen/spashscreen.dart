import 'package:provider/provider.dart';
import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_bottom.dart';
import 'package:tasker/provider/theme_provider.dart';
import 'package:tasker/screens/auth_screen/signin_screen.dart';
import 'package:tasker/widgets/image_logo.dart';
import 'package:flutter/material.dart';
import '../../customs/custom_text.dart';
import '../../resources/color_management.dart';
import '../../resources/string_manager.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:AppStringsDir.textDirection(context) ,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                    height: 140,
                    width: 120,
                    alignment: Alignment.center,
                    child: ImageLogo(context)),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  name: AppStringsDir.welcome(context),
                  onPressed: (){
                    Provider.of<ThemeProvider>(context,listen: false).changelan(true);
                  },
                  alignmentGeometry: Alignment.center,
                  color: ColorManager.greentowhite(context),
                  fontWeight: FontWeight.w500,
                  font: 35,
                ),
                const SizedBox(
                  height: 220,
                ),
                Align(
                    alignment: Alignment.center,
                    child: CustomBottonLogin(
                      name: AppStringsDir.login(context),
                      onPressed: () {
                        navigatTo(context, SignInScreen());
                      },
                      height: 61,
                      width: 302,
                      color: ColorManager.blackColor.withOpacity(0.5),
                      colorr: ColorManager.whiteColor,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/Info_alt_light.png",color: ColorManager.blacktowhite(context)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomText(
                          name: AppStringsDir.begin2(context),
                          alignmentGeometry: Alignment.center,
                          color: ColorManager.blacktowhite(context),
                          fontWeight: FontWeight.bold,
                          font: 12,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
