import 'package:flutter/material.dart';
import 'package:pickanddrop/utils/util.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  final String text;
  final double size;
  final double borderRadius;
  final String bgcolor;
  bool isBold;
  double width;
  String fgcolor;

  MyText({
      super.key, 
      required this.text,
      required this.size,
      required this.bgcolor,
      required this.borderRadius,
      this.isBold=false,
      this.width=0,
      this.fgcolor="#000000"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      width: width == 0 ? null : width,
      height: width == 0 ? null : width,
      decoration: BoxDecoration(
          color: getColorFromHex(bgcolor),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Center(
        child: Text(text,
            style: TextStyle(
                fontSize: size,
                fontWeight: isBold  ? FontWeight.w600 : FontWeight.normal,
                color: getColorFromHex(fgcolor),
            ),
            textAlign: TextAlign.center),
      ),
    );
  }
}
