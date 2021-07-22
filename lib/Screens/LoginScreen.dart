import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginScreen extends StatelessWidget {

  @override
 String em;
 String pa;
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.amberAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Car of your Dreams', style: GoogleFonts.ubuntu(
                textStyle: TextStyle(fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none))),
            SizedBox(height: 8,),
            Text('Sign in to continue', style: GoogleFonts.ubuntu(
                textStyle: TextStyle(fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none))),
            SizedBox(height: 12,),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: TextField(
                onChanged: (value){
                  Provider.of<CarsProvider>(context, listen: false).userEmail = value;
                  em= Provider.of<CarsProvider>(context, listen: false).userEmail;

                }
                ,
                decoration: InputDecoration(
                    hintText: "Email",
                border: OutlineInputBorder(),
                icon:Icon(Icons.email),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 5,),
            FractionallySizedBox(
            widthFactor: 0.6,
            child: TextField(
              obscureText:true ,
              onChanged: (value){
                Provider.of<CarsProvider>(context, listen: false).userPassword = value;
                pa=Provider.of<CarsProvider>(context, listen: false).userPassword;
              },
    decoration: InputDecoration(
    hintText: "Password",

    border: OutlineInputBorder(),
    icon:Icon(Icons.vpn_key_outlined),
    contentPadding: EdgeInsets.symmetric(horizontal: 20),))
            ),
            SizedBox(height: 10,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(onPressed: () async{
      var dbCredentials= await MySQL().sendResponse(em, pa);

       if(dbCredentials=='exists'){
  Navigator.pushNamed(context, '1');
  print(dbCredentials);
 } else{
 Provider.of<CarsProvider>(context,listen:false).showToast();
 print(dbCredentials);
 }
     },
          child: Text('Sign in', style: GoogleFonts.londrinaSolid(
              textStyle: TextStyle(fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none))),),
    SizedBox(width: 10,),
    Icon(Icons.arrow_forward, color: Colors.white,)
    ],
  ),
            SizedBox(height: 10,),
  SignInButton(Buttons.Google,
      text: "Sign in with Google",
      onPressed: (){}),
            SizedBox(height: 7,),
            SignInButton(Buttons.Facebook,
                text: "Sign in with Facebook",
                onPressed: (){}),
        SizedBox(height: 7,),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '-1');
              },
              child: Text('New user? Register..', style: GoogleFonts.londrinaSolid(
                  textStyle: TextStyle(fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.none))),),

          ],
        ),
      ),
    );
  }
}
