import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizet/methods/bottomSheet.dart';
import '../methods/updateData.dart';
import '../components/buildTextField.dart';
import '../components/showDialog.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

FirebaseAuth _auth = FirebaseAuth.instance;
PickedFile imageFile;
bool pickedImage = false;
String imageUrl;
bool isEnabled;
UpdateData updateData = UpdateData();
FlutterBottomSheet bottomSheet = FlutterBottomSheet();
final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

class _ProfileScreenState extends State<ProfileScreen> {
  String _newName, _newPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(_auth.currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data['photoUrl'] != null) {
            pickedImage = true;
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Edit Profile",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: pickedImage
                                    ? NetworkImage(snapshot.data['photoUrl'])
                                    : NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659651_960_720.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) =>
                                      bottomSheet.bottomSheet()),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  color: Color(0xffB721FF),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          BuildTextField(
                            onSaved: (input) => _newName = input,
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'The Name should not be empty';
                              }
                              if (input.length > 18) {
                                return 'The name should not be greater than 18 characters';
                              }
                              return null;
                            },
                            enabled: true,
                            obscureText: false,
                            labelText: "Nick Name",
                            hintText: snapshot.data['displayName'],
                          ),
                          BuildTextField(
                            obscureText: false,
                            labelText: "Email",
                            hintText: snapshot.data['email'],
                            enabled: false,
                          ),
                          BuildTextField(
                            onSaved: (input) => _newPassword = input,
                            validator: (input) {
                              if (input.length < 4) {
                                return 'Password Should be at least four characters ';
                              }
                              return null;
                            },
                            obscureText: true,
                            labelText: "Password",
                            hintText: "********",
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            final formState = _globalKey.currentState;
                            if (formState.validate()) {
                              formState.save();
                              try {
                                updateData.updateNickName(_newName);
                                auth.currentUser.updatePassword(_newPassword);
                              } catch (e) {
                                showDialogBox(
                                  e.message,
                                  context,
                                  'ERROR',
                                  [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                                print(e.message);
                              }
                            }
                          },
                          color: Color(0xffB721FF),
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialogBox(
                          'Do you really want to SIGNOUT',
                          context,
                          'Signout',
                          [
                            FlatButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'signin');
                              },
                              child: Text('Yes'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'),
                            ),
                          ],
                        );
                        _auth.signOut();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffB721FF),
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Sign Out',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialogBox(
                          'Do you really want to Delete your Account',
                          context,
                          'Delete Account',
                          [
                            FlatButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'signup');
                              },
                              child: Text('Yes'),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No'),
                            ),
                          ],
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffB721FF),
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Delete Account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
