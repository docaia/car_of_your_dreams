import 'package:flutter/material.dart';

TextStyle kStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w900);
TextStyle kButtonStyle = TextStyle(backgroundColor: Colors.blueAccent, color: Colors.white);

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
);
}