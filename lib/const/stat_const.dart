import 'package:flutter/material.dart';
import 'package:pokedox/const/text_style.dart';

Widget statRow({
  String? text, String? value,
})
{
  var rowWidth = int.parse(value.toString());
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
      SizedBox(
        width: 100,
        child: headingTextStyle(
          color: Colors.black,
          size: 16,
          text: value,
        ),
      ),
      Container(
        height: 3,
        width: rowWidth.toDouble(),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ],
  );
}