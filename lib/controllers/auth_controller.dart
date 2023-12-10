import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var eMailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading=false.obs;

  //Giriş Yapma
  Future<UserCredential?> loginMethod({context}) async {
    // ignore: non_constant_identifier_names
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: eMailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  Future<UserCredential?> signUpMethod(eMail, password, context) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: eMail, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  void storageUserData(name, password, eMail) {
    var document = fireStore.collection(userCollection).doc(name);
    document.set({
      "isim": name,
      "şifre": password,
      "eMail": eMail,
      "imageURL": "",
      "id": user?.uid,
      "cart_count":"00",
      "wishlist":"00",

    });
  }

  void signout(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
