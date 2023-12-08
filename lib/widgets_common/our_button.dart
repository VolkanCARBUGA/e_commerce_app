import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton(onpress, Color color, Color texColor, String tittle) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10), right: Radius.circular(10))),
      ),
      onPressed: onpress,
      child: tittle.text.color(texColor).fontFamily(bold).make());
}
