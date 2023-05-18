import 'package:flutter/material.dart';
import 'package:pokedox/const/text_style.dart';

Widget pokeContainer(
{
  String? text, Color? color, double? size,
}
    ){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.30),
      borderRadius: BorderRadius.circular(12),
    ),
    child: normalTextStyle(
      color: color,
      size: size,
      text: text!,
    ),
  );
}