import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  String em;
  String pa;
  String name;
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Colors.amberAccent),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50.0,15,50),
          child: Column(
            children: <Widget>[
              Text('Sign Up to Car of your dreams', style: GoogleFonts.ubuntu(
          textStyle: TextStyle(fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none))),
              SizedBox(height: 10,),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: TextField(
                  onChanged: (value){
name=value;
                  }
                  ,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(),
                    icon:Icon(Icons.drive_file_rename_outline),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: TextField(
                  onChanged: (value){
                    em = value;
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
                  onChanged: (value){
pa=value;
                  }
                  ,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    icon:Icon(Icons.vpn_key_outlined),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: () async{
                var nameCheck= await MySQL().signUp(name, em, pa);
                if(nameCheck=='exists'){
                  Provider.of<CarsProvider>(context,listen:false).showToast();
                } else{
                  Navigator.pushNamed(context, '1');
                  print(nameCheck);
                  Provider.of<CarsProvider>(context, listen:false).name = name;
                }

              },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
                child: Text('Sign Up', style: TextStyle(fontSize: 20),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
