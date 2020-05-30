import 'package:car_of_your_dreams/Screens/Car_Selection_Screen.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Screens/Home_Screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context)=>CarsProvider(),
      child: MaterialApp(
        home:HomeScreen(),
            routes: {
         '1': (context) =>HomeScreen(),
         '2': (context)=> CarSelection()
      },
      ),
    );
//
  }
}
