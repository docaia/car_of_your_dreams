import 'package:car_of_your_dreams/Screens/LoginScreen.dart';
import 'package:car_of_your_dreams/Services/googleSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Screens/LoginScreen.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleSignInAPI>(builder: (context, c, child)
    {
      return Scaffold(
        backgroundColor: Colors.greenAccent,
        //one big column containing everything
        body: Column(
          children: <Widget>[
            Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: BoxBorder.lerp(null, null, 0) ,),
                      child:Text("Welcome ${Provider.of<GoogleSignInAPI>(context, listen: false).nameOfCurrentUser}",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) //${c.user.displayName}
                    ),
                    ElevatedButton(onPressed: (){Navigator.pushNamed(context, 'visionAndMission');},
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white) ),
                        child: Text("Our Vision and Mission", style:TextStyle(color: Colors.black))),
                    ElevatedButton(onPressed:() async {
                      Provider.of<GoogleSignInAPI>(context, listen: false).nameOfCurrentUser = null;
                      Provider.of<GoogleSignInAPI>(context, listen: false).handleSignOut();
                      Navigator.pushNamed(context, '0');
                    },
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.amber ) ), //amber
                        child: Text("Sign out"))
                  ],
                ),
              )
            ),
            // Expanded(
            //   flex:1,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0,0,20,0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: <Widget>[
            //         ElevatedButton(onPressed: (){Navigator.pushNamed(context, 'visionAndMission');},
            //             style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white) ),
            //             child: Text("Our Vision and Mission", style:TextStyle(color: Colors.black))),
            //       ]
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Looking for mechanics near you, best and worst details of a car?', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '4');
                      }, style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.greenAccent) ),
                      child: Text("Car Details", style: TextStyle(
                          color: Color(0xFF0E0859),
                          fontWeight: FontWeight.w900,
                          fontSize: 27),),),
                    Icon(Icons.all_inclusive, color: Colors.white30, size: 50,)
                  ]
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(onPressed: () {

                      Navigator.pushNamed(context, '2');

                    }, style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.blueAccent) ),

                      child: Text("Rate your own cars", style: TextStyle(
                          color: Color(0xFF0E0859),
                          fontWeight: FontWeight.w900,
                          fontSize: 25),),),
                  ),
                  Expanded(
                    child:  Container(
                      color: Colors.amber[400],
                      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text('Want to buy a car?', style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.w700,
fontSize: 15,
),),
ElevatedButton(onPressed: () {
Navigator.pushNamed(context, '3');
},
  style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.amber[400]!) ),

child: Text('Choose your criteria', style: TextStyle(
color: Color(0xFF0E0859),
fontWeight: FontWeight.w900,
fontSize: 25),),
),
Icon(Icons.gesture, color: Colors.white30, size: 50,)
]
),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      );
    },
    );
  }
}
