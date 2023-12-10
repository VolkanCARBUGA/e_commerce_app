import 'dart:io';

import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/profile_controller.dart';

import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:e_commerce_app/widgets_common/custom_textfield.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            data["imageURL"] == "" && controller.profileImagepath.isEmpty
                ? Image.asset(
                    imgProfile,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : data["imageURL"] != "" && controller.profileImagepath.isEmpty
                    ? Image.network(
                        data["imageURL"],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImagepath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(
                onpress: () {
                  controller.changeImage(context);
                },
                color: redColor,
                texColor: whiteColor,
                tittle: "Değiştir"),
            20.heightBox,
            Divider(),
            customTextField(
                hint: nameHint,
                tittle: name,
                isPass: false,
                controller: controller.nameConroller),
            customTextField(
                hint: passwordHint,
                tittle: olPassword,
                isPass: true,
                controller: controller.oldPasswordController),
            customTextField(
                hint: passwordHint,
                tittle: newPassword,
                isPass: true,
                controller: controller.newPasswordController),
            20.heightBox,
            controller.isloading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 40,
                    child: ourButton(
                        onpress: () async {
                          controller.isloading(true);
                          if (controller.profileImagepath.value.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink = data["imageURL"];
                          }
                          if (data["şifre"] ==
                              controller.oldPasswordController.text) {
                            controller.changeAuthPassword(
                                eMail: data["eMail"],
                                password: controller.oldPasswordController.text,
                                newPassword:
                                    controller.newPasswordController.text,
                                    
                                    );
                            await controller.updateDocument(
                              imageURL: controller.profileImageLink,
                              password: controller.newPasswordController,
                              name: controller.nameConroller,
                            );
                            VxToast.show(context, msg: "Güncellendi");
                          } else {
                            VxToast.show(context, msg: "Hatalı şifre");
                          }
                        },
                        color: redColor,
                        texColor: whiteColor,
                        tittle: "Kaydet"),
                  ),
          ],
        )
            .box
            .shadowSm
            .white
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
