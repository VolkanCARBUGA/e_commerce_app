import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget(Widget widget) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
            child:widget ,
  );
}
