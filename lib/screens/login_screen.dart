import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:quizet/components/showDialog.dart';
import 'package:quizet/services/analytics.dart';
import '../services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/appButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Authentication authentication = Authentication();
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, 'home');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _email, _password;

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
                      'Welcome',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 200.0, 0.0, 0.0),
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9622FB),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onSaved: (input) => _password = input,
                      // ignore: missing_return
                      validator: (input) {
                        if (input.length < 4) {
                          return 'Password Should be at least four characters';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9622FB),
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'forgot');
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Color(0xff9823FE),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    AppButton(
                      text: 'LOGIN',
                      onPressed: () async {
                        final formState = _formKey.currentState;
                        if (formState.validate()) {
                          formState.save();
                          try {
                            await _auth.signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            );
                            Navigator.pushReplacementNamed(context, 'home');
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
                          }
                        }
                      },
                    ),
                    MaterialButton(
                      color: Color(0xffB721FF),
                      height: 40,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () async {
                        await authentication.googleSignIn();
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'LOGIN WITH GOOGLE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Don\' Have an Account ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Color(0xff9823FE),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
