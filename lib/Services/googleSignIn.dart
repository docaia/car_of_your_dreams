import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI extends ChangeNotifier{
final googleSignIn = GoogleSignIn(
 scopes:[
'profile',
  'email'
 ]
);
GoogleSignInAccount? user;
String? nameOfCurrentUser;
String? emailOfCurrentUser;

Future<GoogleSignInAccount?> googleLogin() async {
try{
  await googleSignIn.signIn();
}catch(error){print(error);}
}
 Future<void> handleSignOut() async{
   await googleSignIn.disconnect();

 }




}
