import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../customs/constants.dart';
import '../customs/custom_text.dart';
import '../provider/switchhomehismode.dart';
import '../resources/color_management.dart';
import '../resources/string_manager.dart';

class CustomWidget extends StatelessWidget {
  String text;
  Widget widget;
  GestureTapCallback? callback;
  CustomWidget({super.key,required this.text,required this.widget,this.callback,});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: ColorManager.greenColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: ColorManager.greenColor,
        body: ListView(
          physics:text== AppStringsDir.Historyoftasks(context)?null:const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if(text=="تــفاصيـل المـهمـة")...[
                        IconButton(onPressed:callback, icon: Icon(Icons.chat_bubble,color: ColorManager.whiteColor,size: 35,))
                      ]else...[
                        const SizedBox(
                          width: 36,
                        ),
                      ],
                      CustomText(
                          name: text,
                          alignmentGeometry: Alignment.center,
                          color: ColorManager.whiteColor,
                          fontWeight: FontWeight.bold,
                          font: 20),
                      InkWell(
                        onTap: () {
                          if(text==AppStringsDir.Historyoftasks(context)){
                            Provider.of<SwitchHomeHisMode>(context,listen: false).changeswitchscreen(true);
                          }else{
                            navigatToback(context);
                          }

                        },
                        child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: ColorManager.blackColor,
                              size: 17,
                            )),
                      ),

                    ]),
              ),
            ),
            Container(
              height: height(context)-110,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)
                  )
              ),
              child: SingleChildScrollView(
                physics: text== "ســجـل المـهـــام"?const NeverScrollableScrollPhysics():null,
                child: widget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



