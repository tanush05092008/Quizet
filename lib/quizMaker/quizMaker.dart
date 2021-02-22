import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizMaker extends StatefulWidget {
  @override
  _QuizMakerState createState() => _QuizMakerState();
}

class _QuizMakerState extends State<QuizMaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        splashColor: Colors.yellow,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'addQuizData');
          showModalBottomSheet(
            context: context,
            builder: ((builder) => BottomSheet()),
          );
        },
        elevation: 4,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffB721FF),
        title: Text('Quiz Maker',style: GoogleFonts.permanentMarker(fontSize: 30),),
        elevation: 0.0,
        centerTitle: true,
      ),
    );
  }

  Widget BottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Create new Quiz',
            style: GoogleFonts.lobster(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hoverColor: Colors.red,
                padding: EdgeInsets.all(20),
                onPressed: () {
                  Navigator.pushNamed(context, 'addQuizData');
                },
                child: Text(
                  'True/False Quiz',
                  style: GoogleFonts.pacifico(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
              ),
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Text(
                  'MCQ Quiz',
                  style: GoogleFonts.pacifico(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Open and Existing Quiz',
            style: GoogleFonts.lobster(fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          OutlineButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(20),
            onPressed: () {},
            child: Text(
              'Open',
              style: GoogleFonts.pacifico(
                color: Colors.purpleAccent,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
