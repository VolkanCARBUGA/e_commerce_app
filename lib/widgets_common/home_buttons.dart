import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButtons(width,height,icon, String tittle,onPressed) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset(
      icon,
      width: 30,
    ),
  ),
  3.heightBox,
  tittle.text
      .fontFamily(semibold)
      .size(12)
      .align(TextAlign.center)
      .make(),
    ],
  ).box.rounded.white.size(width, height).make();
}
