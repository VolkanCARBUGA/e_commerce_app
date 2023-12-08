import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/views/auth_screen/login_screen.dart';
import 'package:e_commerce_app/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen(){
    Future.delayed(Duration(seconds: 5 ),(){
      Get.to(()=>LoginScreen());
    });
  }
  @override
  void initState() {
   changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              icSplashBg,
              width: 300,
            ),
            20.heightBox,
            appLogoWidget(),
            15.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.fontFamily(regular).size(15).white.make(),
            100.heightBox,
            created.text.fontFamily(regular).size(25).white.make(),
          ],
        ),
      ),
    );
  }
}
