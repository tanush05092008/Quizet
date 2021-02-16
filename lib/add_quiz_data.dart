import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizet/methods/bottomSheet.dart';
import 'methods/updateData.dart';
import 'components/buildTextField.dart';
import 'components/showDialog.dart';

class AddQuizData extends StatefulWidget {
  @override
  _AddQuizDataState createState() => _AddQuizDataState();
}

bool isEnabled;
FlutterBottomSheet bottomSheet = FlutterBottomSheet();
final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

class _AddQuizDataState extends State<AddQuizData> {
  String _newName, _newPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Quiz Maker',style: GoogleFonts.permanentMarker(color: Colors.black,fontSize: 30),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
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
                        labelText: "Quiz Name",
                      ),
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
                        labelText: "Quiz Description",
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
                        labelText: "Quiz Image ",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
