import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizet/components/showDialog.dart';
import '../components/appButton.dart';
import '../services/firestore.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  checkAuthentification() async {
    _auth.authStateChanges().listen(
      (user) async {
        if (user != null) {
          print(user);
          Navigator.pushReplacementNamed(context, 'home');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _email, _password, _name;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 35.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Please Type an email';
                        }
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9622FB),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved: (input) => _password = input,
                      // ignore: missing_return
                      validator: (input) {
                        if (input.length < 4) {
                          return 'Password should be at least four characters';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9622FB),
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved: (input) => _name = input,
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'The nick name should not be empty';
                        }
                        if (input.length > 18) {
                          return 'The Nick name should not be greater than 18 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'NICK NAME ',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff9622FB)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    AppButton(
                      text: 'REGISTER',
                      onPressed: () async {
                        final formState = _formKey.currentState;
                        if (formState.validate()) {
                          formState.save();
                          try {
                            UserCredential user =
                                await _auth.createUserWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            );

                            if (user != null) {
                              await _auth.currentUser.updateProfile(
                                displayName: _name,
                              );
                              userSetup(
                                  _auth.currentUser.photoURL, _name, _email, 0);
                              Navigator.pushReplacementNamed(context, 'home');
                            }
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
                                  child: Text(
                                    'OK',
                                  ),
                                ),
                              ],
                            );
                            print(e.message);
                          }
                        }
                      },
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an Account?',
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xff9823FE),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
