import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard(width, String? count, String? title){
  return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "00".text.fontFamily(bold).color(darkFontGrey).size(16).make(),
                  5.heightBox,
                  "Sepet Toplamı".text.color(darkFontGrey).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .width(width)
                  .height(80)
                  .padding(EdgeInsets.all(4))
                  .make();
}