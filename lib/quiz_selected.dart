import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSelected extends StatefulWidget {
  @override
  _QuizSelectedState createState() => _QuizSelectedState();
}

class _QuizSelectedState extends State<QuizSelected> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F143A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff3888EB),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 40, top: 40),
                  child: Text(
                    'Difficulty',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: FlatButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Any',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    color: !isCardGreen?Colors.white:Colors.green,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: FlatButton(
                    onPressed: () {
                    },
                    child: Text(
                      'Easy',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Medium',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Hard',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40, top: 40),
              child: Text(
                'Time',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 100,
                    minWidth: 100,
                    color: Colors.white,
                    icon: Icon(Icons.timer_rounded, size: 30),
                    label: Icon(
                      Icons.timer_3_rounded,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 100,
                    minWidth: 100,
                    color: Colors.white,
                    icon: Icon(Icons.timer_rounded, size: 30),
                    label: Text(
                      '5s',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 100,
                    minWidth: 100,
                    color: Colors.white,
                    icon: Icon(Icons.timer_rounded, size: 30),
                    label: Icon(
                      Icons.timer_10_rounded,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              alignment: Alignment.topLeft,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 100,
                minWidth: 100,
                color: Colors.white,
                child: Text(
                  'No Timer',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40, top: 40),
              child: Text(
                'No. of Questions',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, ),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    minWidth: 50,
                    color: Colors.white,
                    child: Text(
                      '10',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, ),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    minWidth: 50,
                    color: Colors.white,
                    child: Text(
                      '20',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, ),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    minWidth: 50,
                    color: Colors.white,
                    child: Text(
                      '30',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, ),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    minWidth: 50,
                    color: Colors.white,
                    child: Text(
                      '40',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    minWidth: 50,
                    color: Colors.white,
                    child: Text(
                      '50',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40, top: 40),
              child: Text(
                'Quiz Type',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 100,
                    minWidth: 100,
                    color: Colors.white,
                    child: Text(
                      'MCQ',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,),
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 100,
                    minWidth: 100,
                    color: Colors.white,
                    child: Text(
                      'True/False',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 70,),
          ],
        ),
      ),
    );
  }
}
