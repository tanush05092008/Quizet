import 'package:flutter/material.dart';

class QuizMaker extends StatefulWidget {
  @override
  _QuizMakerState createState() => _QuizMakerState();
}

class _QuizMakerState extends State<QuizMaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        elevation: 4,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffB721FF),
        title: Text('Quiz Maker'),
        elevation: 0.0,
        centerTitle: true,
      ),
    );
  }
}
