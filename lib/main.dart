import 'package:firebase_analytics/observer.dart';
import 'screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/bubbleBottomBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/forgot_password.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'services/analytics.dart';

FirebaseAnalytics analytics;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  analytics = FirebaseAnalytics();
  analytics.logAppOpen();
  runApp(Flaggy());
}

class Flaggy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsObserver observer =
        AnalyticsService().getAnalyticsObserver();
    bool isLoggedIn = false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    void checkAuthentification() async {
      _auth.authStateChanges().listen((user) async {
        if (user != null) {
          print(user);
          isLoggedIn = true;
        }
      });
    }

    return MaterialApp(
      navigatorObservers: [observer],
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        'signup': (BuildContext context) => SignupPage(),
        'home': (BuildContext context) => HomePage(),
        'signin': (BuildContext context) => LoginScreen(),
        'forgot': (BuildContext context) => ForgotScreen(),
        'profile': (BuildContext context) => ProfileScreen(),
      },
      home: !isLoggedIn
          ? HomePage(
              analytics: analytics,
              observer: observer,
            )
          : LoginScreen(),
    );
  }
}
