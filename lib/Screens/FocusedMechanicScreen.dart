import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FocusedMechanicScreen extends StatelessWidget {
  FocusedMechanicScreen({required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(backgroundColor: Colors.blue[400],
        body: Container(
        padding: EdgeInsets.only(top: 30),
    decoration: BoxDecoration(color: Colors.blue[400]),//[400]),
    child: Row(
    children: [
    Expanded(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    decoration: BoxDecoration(color: Colors.blueAccent),
    child: Padding(
    padding: const EdgeInsets.only(right: 16, top: 8),
    child: Stack(
    children: [
    Container(
    width: MediaQuery
        .of(context)
        .size
        .width * 0.2,
    height: MediaQuery
        .of(context)
        .size
        .height * 0.1,
    child: Image.asset('Images/CarKenz4.gif')),
]),),),



            Text(name),

              SizedBox(width: 30,),
              Text('car',)

          ],
        ),
      ),
    ]
    ),),),);
  }
}
