import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/customs/custom_text_field.dart';
import 'package:tasker/resources/color_management.dart';
import 'package:tasker/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateTaskScreen extends StatelessWidget {
  const RateTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: "تـقـيـيـم المهمة",
        widget: Column(
          children: [
            const SizedBox(height: 20,),
            CustomText(name: "UI Mobile Development", fontWeight: FontWeight.w600, font: 24,color: ColorManager.blacktowhite(context).withOpacity(0.7),),
            const SizedBox(height: 20,),
            CustomText(width: 334,alignmentGeometry: Alignment.centerRight,name: "ملاحظات", fontWeight: FontWeight.w600, font: 16,color: ColorManager.blacktowhite(context).withOpacity(0.7),),
            CustomTextFormFeldnote(textInputType: TextInputType.text, ii: 334, isStwich: false,color: ColorManager.blackColor,colorr: ColorManager.blackColor,i: 10,line: 7,),
            const SizedBox(height: 20,),
            SizedBox(width: 334,child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                width: 60,
             ),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 32,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: ColorManager.starColor,
                  ), onRatingUpdate: (double value) {

                },),
                CustomText(name: "التقييم", fontWeight: FontWeight.w600, font: 16,color: ColorManager.blacktowhite(context).withOpacity(0.7),),
              ],
            )),
            const SizedBox(height: 100,),
            Image.asset("assets/icons/bigdone.png")
          ],
        ));
  }
}
