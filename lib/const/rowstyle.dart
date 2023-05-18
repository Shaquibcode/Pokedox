import 'package:flutter/material.dart';
import 'package:pokedox/const/text_style.dart';

Widget rowStyle(
{
  String? text, String? value
}
    ){
  return Row(
    children: [
      SizedBox(
        width: 100,
        child: headingTextStyle(
            color: Colors.grey,
            size: 16,
            text: text,
        ),
      ),
      headingTextStyle(
          color: Colors.grey,
          size: 16,
          text: value,
      ),
    ],
  );
}