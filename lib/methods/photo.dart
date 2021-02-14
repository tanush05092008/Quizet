import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Photo {
  PickedFile imageFile;
  ImagePicker picker = ImagePicker();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future takePhoto(ImageSource source) async {
    var pickedFile = await picker.getImage(source: source);
    imageFile = pickedFile;
    uploadImage();
  }

  void uploadImage() async {
    final Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('ProfilePictures/${_auth.currentUser.uid.toString()}.jpg');
    var imageString = await firebaseStorageRef.getDownloadURL();
    File file = File(imageFile.path);
    await firebaseStorageRef.putFile(file);
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(_auth.currentUser.uid)
        .update({
      'photoUrl': imageString,
    });
  }
}
