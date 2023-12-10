import 'package:e_commerce_app/consts/firebase_consts.dart';

class FirestoreServices {
  static getUser( id) {
    return fireStore
        .collection(userCollection)
        .where("id", isEqualTo: id)
        .snapshots();
  }
}
