import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(
    String photoUrl, String displayName, String email, int coin) {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  users.doc(auth.currentUser.uid).set({
    'displayName': displayName,
    'email': email,
    'photoUrl': photoUrl,
    'coin': coin
  });
  return null;
}
