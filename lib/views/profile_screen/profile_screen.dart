import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/firebase_consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/controllers/profile_controller.dart';
import 'package:e_commerce_app/services/firestore_services.dart';
import 'package:e_commerce_app/views/auth_screen/login_screen.dart';
import 'package:e_commerce_app/views/profile_screen/components/deatils_card.dart';
import 'package:e_commerce_app/views/profile_screen/edit_profile_screen.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(Scaffold(
        body: StreamBuilder(
      stream: FirestoreServices.getUser(user!.uid),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),
          );
        } else {
         var data = snapshot.data!.docs[0].data() as Map<String, dynamic>;
          return SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Icon(
                      Icons.edit,
                      color: whiteColor,
                    ),
                    alignment: Alignment.centerRight,
                  ).onTap(() {
                    controller.nameConroller.text=data["isim"];
                   

                    
                    Get.to(() => EditProfileScreen(
                          data: data,
                        ));
                  })),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    data["imageURL"]==""?
                    Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make():Image.network(
                      data["imageURL"],
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    5.heightBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "${data["name"]}"
                            .text
                            .fontFamily(semibold)
                            .color(whiteColor)
                            .make(),
                        5.heightBox,
                        "${data["eMail"]}"
                            .text
                            .size(15)
                            .color(whiteColor)
                            .fontFamily(semibold)
                            .make()
                      ],
                    )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          side: BorderSide(
                              color: whiteColor, style: BorderStyle.solid),
                        ),
                        onPressed: () async {
                          Get.put(AuthController()).signout(context);
                          Get.to(() => LoginScreen());
                        },
                        child: logout.text
                            .fontFamily(semibold)
                            .color(whiteColor)
                            .make())
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(context.screenWidth / 3.4, "00", "Sepet Toplamı"),
                  detailsCard(context.screenWidth / 3.4, "32", "istek listesi"),
                  detailsCard(context.screenWidth / 3.4, "67", "siparişlerim"),
                ],
              ),
              10.heightBox,
              ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: redColor,
                        );
                      },
                      itemCount: profileButtonslist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: "${profileButtonslist[index]}"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          leading: Image.asset(
                            profileButtonsIcons[index],
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        );
                      })
                  .box
                  .white
                  .rounded
                  .margin(EdgeInsets.all(12))
                  .padding(EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make()
                  .box
                  .color(lightGrey)
                  .make()
            ],
          ));
        }
      },
    )));
  }
}
