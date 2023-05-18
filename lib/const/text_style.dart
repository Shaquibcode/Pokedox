import 'package:flutter/material.dart';

Widget headingTextStyle({
  String? text, Color? color, double? size
}){
  return Text(
    text!,
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );
}

Widget normalTextStyle({
  String? text, Color? color, double? size
}){
  return Text(
    text!,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
    ),
  );
}