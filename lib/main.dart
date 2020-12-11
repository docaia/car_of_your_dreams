import 'package:car_of_your_dreams/Screens/Car_Selection_Screen.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Screens/Criteria_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context)=>CarsProvider(),
        child: MaterialApp(
          home:HomeScreen(),
          routes: {
            '1': (context) =>HomeScreen(),
            '2': (context)=> CarSelection(),
            '3': (context)=> CriteriaScreen()
          },
          theme: ThemeData(
            cupertinoOverrideTheme: CupertinoThemeData( // <---------- this
              textTheme: CupertinoTextThemeData(
                pickerTextStyle: kStyle,
              ),
            ),

          ),
        )
    );
//
  }
}
