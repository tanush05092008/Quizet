import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            title: Text(
              'Forgot Password',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserat',
              ),
            ),
            content: Text(
              'Email is sent.Please Check your Mail Box',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserat',
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'signin');
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  String _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9823FE),
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'We will mail you a link ... Please click on that link to reset your  password',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Theme(
                    data: ThemeData(
                      hintColor: Color(0xff9823FE),
                    ),
                    child: TextFormField(
                      cursorColor: Color(0xff9823FE),
                      validator: (input) {
                        if (input.isEmpty) {
                          // ignore: missing_return,
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                MaterialButton(
                  color: Color(0xffB721FF),
                  height: 40,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _email)
                          .then(
                            (value) => showMessage(),
                          );
                    }
                  },
                  child: Center(
                    child: Text(
                      'FORGOT PASSWORD',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
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
