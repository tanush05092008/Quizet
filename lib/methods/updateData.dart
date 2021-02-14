import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateData {
  Future<void> updateNickName(String newName) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser.uid)
        .update({'displayName': newName}).then((value) {
      print('UPDATED');
    }).catchError((e) {
      print(e);
    }).catchError((e) {
      print(e);
    });
  }
}
