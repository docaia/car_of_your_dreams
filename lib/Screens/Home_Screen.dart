import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarsProvider>(builder: (context, c, child)
    {
      return Scaffold(
        backgroundColor: Colors.amber,
        //one big column containing everything
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Want to buy a car?', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),),
                    FlatButton(onPressed: () {
                      Navigator.pushNamed(context, '3');
                    },
                      color: Colors.amber,
                      child: Text('Choose your criteria', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 25),),
                    ),
                    Icon(Icons.gesture, color: Colors.white30, size: 50,)
                  ]
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(onPressed: () {

                      Navigator.pushNamed(context, '2');
                    }, color: Colors.blueAccent,
                      child: Text("Your own car", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),),),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {}, color: Colors.greenAccent,
                      child: Text("Select location", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),),),
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
