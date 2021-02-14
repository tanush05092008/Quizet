import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizet/methods/photo.dart';

class FlutterBottomSheet {
  Photo photo = Photo();

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    photo.takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera')),
              FlatButton.icon(
                onPressed: () {
                  photo.takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.photo),
                label: Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
