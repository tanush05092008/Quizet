import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/customAppBar.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const HomeScreen({Key key, this.analytics, this.observer}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int currentIndex;
  User user;
  bool isloggedin = false;
  bool pickedImage = false;
  String quizId;
  String documentId;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, 'signin');
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9823FE),
      appBar: CustomAppBar(
        MediaQuery.of(context).size.height * 0.13,
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(_auth.currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data['photoUrl'] != null) {
              pickedImage = true;
            }
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CircleAvatar(
                      minRadius: 22,
                      backgroundColor: Colors.white,
                      backgroundImage: pickedImage
                          ? NetworkImage(snapshot.data['photoUrl'])
                          : NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659651_960_720.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      snapshot.data['displayName'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      'assets/coin.png',
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Coins',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data['coin'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 4,
              left: 10,
            ),
            child: Text(
              'Choose Your',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat',
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 4,
              left: 10,
            ),
            child: Text(
              'Category',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat',
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Categories').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: snapshot.data.docs.map((documents) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      documents['imageUrl'],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  documents['title'],
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
