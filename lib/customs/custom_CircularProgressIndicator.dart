import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
        ),
      ),
    );
  }
}

