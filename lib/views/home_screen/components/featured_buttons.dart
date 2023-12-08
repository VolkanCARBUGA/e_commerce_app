import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButtons(  String? tittle, icon){
  return Row(
children: [
  Image.asset(icon,width: 40,height: 40,fit: BoxFit.cover,),
  10.heightBox,
  tittle!.text.fontFamily(semibold).size(15).color(darkFontGrey).make()

],
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).white.padding(EdgeInsets.all(8)).roundedSM.outerShadowSm.make();
}