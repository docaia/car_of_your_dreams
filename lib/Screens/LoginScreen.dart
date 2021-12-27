import 'package:car_of_your_dreams/Services/googleSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:car_of_your_dreams/Screens/Home_Screen.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes:[
      'profile',
      'email'
    ]
);

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  late String em;
  late String pa;
  GoogleSignInAccount? currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        currentUser = account;
      });
    });
     _googleSignIn.signInSilently();
  }
  @override


  Widget build(BuildContext context) {
    return Material(
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) async{
          if(event.isKeyPressed(LogicalKeyboardKey.enter)){
            print('enter key pressed');
            var dbCredentials= await MySQL().sendResponse(em, pa);

            if(dbCredentials=='exists'){
              Provider.of<GoogleSignInAPI>(context,listen: false).nameOfCurrentUser = em;
              Navigator.pushNamed(context, '1');
              print(dbCredentials);
            } else{
              Provider.of<CarsProvider>(context,listen:false).showToast();
              print(dbCredentials);
            }
          }
        },
        child: Scaffold(
          body: buildHomeScreen()
        ),
      )
    );
  }
  Widget buildHomeScreen(){
if (currentUser != null){
  Provider.of<GoogleSignInAPI>(context, listen: false).nameOfCurrentUser = currentUser?.displayName;
  print(Provider.of<GoogleSignInAPI>(context, listen: false).nameOfCurrentUser);
 return HomeScreen() ;
 //  return Column(
 //    children: <Widget> [
 //      ListTile(
 //        leading: GoogleUserCircleAvatar(identity: _CurrentUser!,),
 //        title: Text(_CurrentUser?.displayName ?? ''),
 //        subtitle: Text(_CurrentUser?.email ?? ''),
 //      ),
 //      ElevatedButton(onPressed: _handleSignOut,
 //        child: Text('Sign Out'),)
 //    ],
 //  );
}
else return Container(
  decoration: BoxDecoration(color: Colors.amberAccent),
  child: Column(
    children: [
      Flexible(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(alignment: Alignment.centerLeft,
                  child: WelcomeText('Get to know the highest rated cars,')),
              Align(alignment: Alignment.centerLeft,child: WelcomeText('good and bad things for each car,')),
              Align(alignment: Alignment.centerLeft,child: WelcomeText('best car mechanics near you,')),
              Align(alignment: Alignment.centerLeft,child: WelcomeText('best car agencies,')),
              Align(alignment: Alignment.centerLeft,child: WelcomeText('and more..')),
              SizedBox(height: 100,),
              Text('Welcome to Car of your Dreams', style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(fontSize: 35,
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
                    em= Provider.of<CarsProvider>(context, listen: false).userEmail!;

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
                        pa=Provider.of<CarsProvider>(context, listen: false).userPassword!;
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
                      Provider.of<GoogleSignInAPI>(context,listen: false).nameOfCurrentUser = em;
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
                  onPressed: _handleSignIn),
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
              SizedBox(height: 50,),

            ],
          ),
        ),
      ),
    ],
  ),
);
  }
  Future<void> _handleSignIn() async {
    try{
      await  _googleSignIn.signIn();
    }catch(error){print(error);}
  }

  Future<void> handleSignOut() async{
    await _googleSignIn.disconnect();

  }
}

class WelcomeText extends StatelessWidget {
   WelcomeText(this.welcomeText) ;
String welcomeText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
      child: Text(welcomeText,
          style: kTextStyleLoginScreen),
    );
  }
  //'Get to know the highest rated cars, good and bad things for each car, best car mechanics near you, best car agencies and more...'
}
