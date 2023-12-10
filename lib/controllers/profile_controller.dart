import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImagepath = "".obs;
  var profileImageLink = "";
  var isloading = false.obs;

  var nameConroller = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagepath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var fileName = basename(profileImagepath.value);
    var destination = "images/${user!.uid}/$fileName";
    var referance = FirebaseStorage.instance.ref().child(destination);
    await referance.putFile(File(profileImagepath.value));
    profileImageLink = await referance.getDownloadURL();
  }

  updateDocument({name, password, imageURL}) async {
    var store = fireStore.collection(userCollection).doc(user!.uid);
    await store.set({
      "isim": name,
      "şifre": password,
      "imageURL": imageURL,
    }, SetOptions(merge: true));
    isloading(false);
  }

  changeAuthPassword({eMail, password, newPassword,context}) async {
    var userCredential =
        EmailAuthProvider.credential(email: eMail, password: password);
    await auth.currentUser!
        .reauthenticateWithCredential(userCredential)
        .then((value) {
          user!.updatePassword(newPassword);
        }).catchError((onError){
          VxToast.show(context, msg: onError.toString());
        });
  }
}
