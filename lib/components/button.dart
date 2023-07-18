import 'package:flutter/material.dart';
import 'package:pickanddrop/utils/util.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final String bgcolor;
  final double borderRadius;
  final String fgcolor;
  final double fontSize;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.bgcolor,
    required this.borderRadius,
    required this.fgcolor,
    required this.fontSize,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: getColorFromHex(bgcolor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text, 
          style: TextStyle(
            color: getColorFromHex(fgcolor),
            fontSize: fontSize
          )
        ),
      ),
    );
  }
}