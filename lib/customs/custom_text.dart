import 'package:flutter/material.dart';
import 'package:tasker/resources/string_manager.dart';

class CustomText extends StatelessWidget {
  final String name;
  final GestureTapCallback? onPressed;
  final AlignmentGeometry? alignmentGeometry;
  final FontWeight fontWeight;
  final double font;
  final double? height;
  final String? fontFa;
  final double? width;
  final Color? color;
  CustomText(
      {Key? key,
      required this.name,
      this.onPressed,
      this.alignmentGeometry,
      required this.fontWeight,
      this.height,
      this.width,
      required this.font,
        this.fontFa,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: alignmentGeometry,
        child: Text(
          name,
          maxLines: 5,
          textDirection: AppStringsDir.textDirection(context),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration:name=="All Widget"?
              TextDecoration.underline:null,
              color: color,
              fontFamily: "Cairo",
            fontSize: font,
            fontWeight: fontWeight
          ),
        ),
      ),
    );
  }
}
class CustomText2 extends StatelessWidget {
  final String name;
  final GestureTapCallback? onPressed;
  final AlignmentGeometry? alignmentGeometry;
  final FontWeight fontWeight;
  final double font;
  final double? height;
  final String? fontFa;
  final double? width;
  final Color? color;
  CustomText2(
      {Key? key,
        required this.name,
        this.onPressed,
        this.alignmentGeometry,
        required this.fontWeight,
        this.height,
        this.width,
        required this.font,
        this.fontFa,
        this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: alignmentGeometry,
        child: Text(
          name,
          maxLines: 1,
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration:name=="All Widget"?
              TextDecoration.underline:null,
              color: color,
              fontFamily: "Cairo",
              fontSize: font,
              fontWeight: fontWeight
          ),
        ),
      ),
    );
  }
}

class CustomTextPoppins extends StatelessWidget {
  final String name;
  final GestureTapCallback? onPressed;
  final AlignmentGeometry? alignmentGeometry;
  final FontWeight fontWeight;
  final double font;
  final double? height;
  final String? fontFa;
  final double? width;
  final Color? color;
  CustomTextPoppins(
      {Key? key,
        required this.name,
        this.onPressed,
        this.alignmentGeometry,
        required this.fontWeight,
        this.height,
        this.width,
        required this.font,
        this.fontFa,
        this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: alignmentGeometry,
        child: Text(
          name,
          maxLines: 5,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration:name=="All Widget"?
              TextDecoration.underline:null,
              color: color,
              fontFamily: "Poppins",
              fontSize: font,
              fontWeight: fontWeight
          ),
        ),
      ),
    );
  }
}



