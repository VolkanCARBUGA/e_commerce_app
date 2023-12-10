import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/firebase_consts.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/views/home_screen/home.dart';

import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/custom_textfield.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheck = false;
  var controller = Get.put(AuthController());
  var nameConroller = TextEditingController();
  var eMailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

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
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: nameHint,
                      tittle: name,
                      controller: nameConroller,
                      isPass: false),
                  customTextField(
                      hint: eMailHint,
                      tittle: eMail,
                      controller: eMailController,
                      isPass: false),
                  customTextField(
                      hint: password,
                      tittle: password,
                      controller: passwordController,
                      isPass: true),
                  customTextField(
                      hint: reTypePassword,
                      tittle: password,
                      controller: passwordRetypeController,
                      isPass: true),
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
                  5.heightBox,
                  controller.isLoading.value
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                              onpress: () async {
                                if (isCheck) {
                                  controller.isLoading(true);
                                  try {
                                    await controller
                                        .signUpMethod(eMailController.text,
                                            passwordController.text, context)
                                        .then((value) {
                                      return controller.storageUserData(
                                          nameConroller.text,
                                          passwordController.text,
                                          eMailController.text);
                                    }).then((value) {
                                      VxToast.show(context,
                                          msg: loginSuccessful);
                                      Get.offAll(() => Home());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    VxToast.show(context, msg: logOut);
                                    controller.isLoading(false);
                                  }
                                } else {}
                              },
                              color: isCheck ? golden : lightGrey,
                              texColor: isCheck ? redColor : lightGrey,
                              tittle: signUp)
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
            ),
          ],
        ),
      ),
    ));
  }
}
