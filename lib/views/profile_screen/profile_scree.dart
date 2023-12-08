import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              
              Row(
                children: [
                  Image.asset(
                    imgProfile,
                    width: 130,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Mevcut Kullanıcı "
                          .text
                          .fontFamily(semibold)
                          .color(whiteColor)
                          .make(),
                      5.heightBox,
                      "volkanilkyar@gmail.com".text.make()
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: whiteColor,
                      style: BorderStyle.solid
                      ),

                    ),
                      onPressed: () {},
                      child: logout.text.fontFamily(semibold).make())
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
