import 'package:tasker/customs/constants.dart';
import 'package:tasker/customs/custom_text.dart';
import 'package:tasker/provider/get_days.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CruserScreen extends StatelessWidget {
  List<String> text;
   CruserScreen({Key? key,required this.text}) : super(key: key);
  CarouselController pageController=CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = text.map((item) =>
        CustomText(name: text[text.indexOf(item)],
            alignmentGeometry: Alignment.center,
            fontWeight:text.indexOf(item)==Provider.of<GetDays>(context).month?FontWeight.w600: FontWeight.w600, font:text.indexOf(item)==Provider.of<GetDays>(context).month-1? 20:12))
        .toList();
    return   Row(
      children: [
        Icon(Icons.arrow_back),
        Expanded(
          child: Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.2,
                  onPageChanged: (val,CarouselPageChangedReason){
                    Provider.of<GetDays>(context,listen: false).changeMonth(val+1);
                  },
                  viewportFraction: 0.35,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true,
                  initialPage: 0,
                  autoPlay: false,
                ),
                carouselController: pageController,
                items: imageSliders,
              )),
        ),
          Icon(Icons.arrow_forward_rounded),
      ],
    );
  }

}
