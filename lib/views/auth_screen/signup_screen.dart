import 'package:e_commerce_app/consts/consts.dart';

import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/custom_textfield.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenWidth * 0.3).heightBox,
            appLogoWidget(),
            20.heightBox,
            "Üye Ol $appname".text.fontFamily(semibold).size(17).white.make(),
            10.heightBox,
            Column(
              children: [
                customTextField(hint: nameHint, tittle: name),
                customTextField(hint: eMailHint, tittle: eMail),
                customTextField(hint: password, tittle: password),
                customTextField(hint: reTypePassword, tittle: password),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                        activeColor: redColor,
                        checkColor: fontGrey,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue!;
                          });
                        }),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: termsAnConditons,
                            style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            )),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: privacyPoliciy,
                            style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            )),
                        TextSpan(
                            text: "  Kabul Ediyorum",
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            )),
                      ])),
                    )
                  ],
                ),
                ourButton(() {}, isCheck ? golden : lightGrey,
                        isCheck ? redColor : lightGrey, signUp)
                    .box
                    .width(context.screenWidth - 70)
                    .make(),
                10.heightBox,
                RichText(
                    textAlign: TextAlign.center,
                    textWidthBasis: TextWidthBasis.parent,
                    text: TextSpan(children: [
                      TextSpan(
                        text: createAlReadyAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor),
                      ),
                    ])).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(EdgeInsets.all(20))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
