import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:quizet/screens/profile_screen.dart';
import '../homeScreen.dart';
import '../quizMaker/quizMaker.dart';

class HomePage extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const HomePage({Key key, this.analytics, this.observer}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void bubbleBottomBarTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (currentIndex == 0)
          ? HomeScreen(
              analytics: widget.analytics,
              observer: widget.observer,
            )
          : (currentIndex == 1)
              ? QuizMaker()
              : (currentIndex == 2)
                  ? ProfileScreen()
                  : HomeScreen(
                      analytics: widget.analytics,
                      observer: widget.observer,
                    ),
      bottomNavigationBar: BubbleBottomBar(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        opacity: 0.2,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        hasNotch: false,
        hasInk: true,
        inkColor: Colors.black12,
        onTap: bubbleBottomBarTapped,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            title: Text('Home'),
            backgroundColor: Color(0xffB721FF),
            activeIcon: Icon(
              Icons.dashboard_rounded,
              color: Color(0xffB721FF),
            ),
            icon: Icon(
              Icons.dashboard_rounded,
              color: Colors.black,
            ),
          ),
          BubbleBottomBarItem(
            title: Text('Quiz Maker'),
            backgroundColor: Color(0xffB721FF),
            activeIcon: Icon(
              Icons.question_answer,
              color: Color(0xffB721FF),
            ),
            icon: Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
          ),
          BubbleBottomBarItem(
            title: Text('Profile'),
            backgroundColor: Color(0xffB721FF),
            activeIcon: Icon(
              Icons.account_circle_rounded,
              color: Color(0xffB721FF),
            ),
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
