import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget( {Key? key,required this.text,this.fontWeight=FontWeight.bold,this.fontSize=kFontSize13 ,
    this.color=kGreyColor, }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    ),);
  }
}