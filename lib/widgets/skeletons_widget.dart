import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import '../resources/color_management.dart';

class SkeletonsWidget extends StatelessWidget {
  int index;
   SkeletonsWidget({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: index,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration:  BoxDecoration(color: ColorManager.whiteColor),
          child: const SkeletonItem(
              child: Column(
                children: [
                  Row(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            shape: BoxShape.rectangle, width: 50, height: 50),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              shape: BoxShape.rectangle, width: 50, height: 50),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}



class SkeletonsWidget2 extends StatelessWidget {
  int index;
  SkeletonsWidget2({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: index,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:  BoxDecoration(color: ColorManager.whiteColor),
        child:const SkeletonItem(child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 50, height: 50),
        )),
        ),
      ),
    );
  }
}