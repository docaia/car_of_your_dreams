import 'dart:ui';
import 'package:car_of_your_dreams/Screens/BestMechanicScreen.dart';
import 'package:car_of_your_dreams/Screens/Car_Selection_Screen.dart';
import 'package:car_of_your_dreams/Screens/FocusedMechanicScreen.dart';
import 'package:car_of_your_dreams/Screens/HopeScreen.dart';
import 'package:car_of_your_dreams/Screens/MechanicRatingArabic.dart';
import 'package:car_of_your_dreams/Screens/WhatDoYouWantScreen.dart';
import 'package:car_of_your_dreams/widgets/UserInputScreen.dart';
import 'package:car_of_your_dreams/widgets/UserInputGood.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:car_of_your_dreams/Services/googleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Screens/Criteria_Screen.dart';
import 'package:car_of_your_dreams/Screens/Location_Screen.dart';
import 'package:car_of_your_dreams/Screens/LoginScreen.dart';
import 'package:car_of_your_dreams/Screens/SignUp_Screen.dart';
import 'package:car_of_your_dreams/Screens/VisionAndMissionScreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'Screens/resultsOfMechanicsScren.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'Services/translation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() { inDebug = true; return true; }());
    // In debug mode, use the normal error widget which shows
    // the error message:
    if (inDebug)
      return ErrorWidget(details.exception);
    // In release builds, show a yellow-on-blue message instead:
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error! ${details.exception}',
        style: TextStyle(color: Colors.yellow),
        textDirection: TextDirection.ltr,
      ),
    );
  };
  // Here we would normally runApp() the root widget, but to demonstrate
  // the error handling we artificially fail:

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider<CarsProvider>(create: (_) => CarsProvider()),
          ListenableProvider<GoogleSignInAPI>(create: (_) => GoogleSignInAPI()),
                  ],
        child: GetMaterialApp(
          scrollBehavior: MyCustomScrollBehavior(), //fixing the scrolling for web
          title: 'Rate the car mechanics',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('es'), // Spanish
            Locale('ar'), // Arabic
          ],
          textDirection: TextDirection.ltr,
          translations: TranslationService(),
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          home:WhatDoYouWant(),//
          routes: {
            '-1': (context)=> SignUpScreen(),
            '0': (context)=> LoginScreen(),
            '1': (context) =>HomeScreen(),
            '2': (context)=> CarSelection(),
            '3': (context)=> CriteriaScreen(),
            '4': (context)=> ShowLocation(),
            '5': (context)=> UserInputScreen(issueDescribe: "What is the worst Problem", toScreenNum:'6', rightButtonText: 'Submit, Go Next', goodOrBadList: Provider.of<CarsProvider>(context, listen: false).problemsList, selectedIssue: Provider.of<CarsProvider>(context,listen: false).selectedIssueBad,),
            '6': (context)=> UserInputGood(issueDescribe: "What is the best thing in this car", toScreenNum:'7', rightButtonText: 'Submit, Go Next', goodOrBadList: Provider.of<CarsProvider>(context, listen: false).advantagesList, selectedIssue: Provider.of<CarsProvider>(context,listen: false).selectedIssueGood),
            '7': (context)=> BestMechanicScreen(issueDescribe: "Who is the best mechanic for this car", toScreenNum:'1', rightButtonText: 'Finish', goodOrBadList: [],),
            'visionAndMission':(context)=> VandM(),
            'hope': (context)=>MassVotingScreen(),
            'mechResults':(context)=>ResultsMech(),
            '8':(context)=> MechanicRating(issueDescribe: "mechTitle".tr, toScreenNum: '1',rightButtonText: 'send'.tr, goodOrBadList: [],),
            'home':(context)=>WhatDoYouWant(),
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
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}
