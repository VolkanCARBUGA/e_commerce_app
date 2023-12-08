import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var auth=FirebaseAuth.instance;
var fireStore=FirebaseFirestore.instance;
var user=auth.currentUser;
const userCollection="users";