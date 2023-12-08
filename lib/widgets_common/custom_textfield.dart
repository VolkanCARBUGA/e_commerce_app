import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? tittle,String? hint,controller,isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      tittle!.text.color(redColor).fontFamily(semibold).size(17).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
      obscureText: isPass,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: redColor)),
        ),
      ),
      5.heightBox,

    ],
  );
}
