import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w900);
TextStyle kButtonStyle = TextStyle(backgroundColor: Colors.blueAccent, color: Colors.white);
TextStyle kTextStyleLoginScreen = GoogleFonts.raleway(
    textStyle: TextStyle(fontSize: 40,
        color: Color(0xFF5C231F),
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none));

const kMessageContainerDecoration = BoxDecoration(
    border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type what you believe is the worst problem for this car here...',
  border: InputBorder.none,
);
const kMessageTextFieldDecorationBest = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type what you believe is the best thing about this car here...',
  border: InputBorder.none,
);
InputDecoration kMessageTextFieldDecorationForm(textDescription) {
  return InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: textDescription,
  border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color:Colors.white, width: 2)
    ),
);
  }
TextStyle kCriteriaListStyle = GoogleFonts.ubuntu(textStyle: TextStyle(
    fontSize: 25,
    color: Colors.white70,
    fontWeight: FontWeight.w400));

TextStyle kTabla = TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.blue[900]);