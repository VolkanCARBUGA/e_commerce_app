import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/auth_screen/signup_screen.dart';
import 'package:e_commerce_app/views/home_screen/home.dart';
import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/custom_textfield.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            "Giriş Yap $appname"
                .text
                .fontFamily(semibold)
                .size(17)
                .white
                .make(),
            10.heightBox,
            Column(
              children: [
                customTextField(hint: eMailHint, tittle: eMail),
                customTextField(hint: password, tittle: password),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgotPassword.text.make())),
                5.heightBox,
                ourButton(() {
                  Get.to(() => Home());
                }, redColor, whiteColor, login)
                    .box
                    .width(context.screenWidth - 70)
                    .make(),
                5.heightBox,
                createNewAccount.text
                    .color(fontGrey)
                    .fontFamily(semibold)
                    .size(17)
                    .make(),
                5.heightBox,
                ourButton(() {
                  Get.to(() => SignUpScreen());
                }, golden, redColor, signUp)
                    .box
                    .width(context.screenWidth - 70)
                    .make(),
                10.heightBox,
                loginWith.text
                    .color(fontGrey)
                    .fontFamily(semibold)
                    .size(17)
                    .make(),
                5.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  backgroundColor: lightGrey,
                                  radius: 25,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 30,
                                  )),
                            )))
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
