import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class VandM extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(child:Scaffold(
      backgroundColor: Colors.black,
      body: RawScrollbar(
        isAlwaysShown: true,
        radius: Radius.circular(60),
        thickness: 10,
        thumbColor: Colors.white,
        child: SingleChildScrollView(
          child: (
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(onPressed:(){

                      Navigator.pushNamed(context, '1');
                    },
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.black) ),
                        child: Text("Back to Home")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Vision', style: GoogleFonts.acme(textStyle:TextStyle(fontSize: 50, color: Colors.white, fontWeight:FontWeight.w500 )),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,10,20),
                  child: Text('Our vision is that everyone has the right to know more about their cars. You have the right to know the mechanics who can fix your can and what does the community near you think about them. You have the right to know the experiences and leassons learnt from long time owners of the car you want to buy. If we are successful, we beleive this will be a new era in car industry in Egypt: people will have the system to rate mechanics, more clarity and transparency will be there and a firm rating system in place',
                    style: GoogleFonts.acme(textStyle:TextStyle(fontSize: 25, color: Colors.white, fontWeight:FontWeight.w500 )),),
                ),
                SizedBox(height: 200,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Mission', style: GoogleFonts.acme(textStyle:TextStyle(fontSize: 50, color: Colors.white, fontWeight:FontWeight.w500 )),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,10,0),
                  child: Text('Our mission is to keep a live database for all the car mechanics and electricians in Egypt. This database will be updated continuously by us: the car owners, if a mechanic is good, his rating should go up quickly and he should be visible to everyone, if someone is bad, it should be know also quickly. We also want to make the decision of buying a car a simple and easy decision, with thousands of car owners experience about the best and worst issues of their cars, new car buyers will be able to instantly if this is the car they are looking for.',
                    style: GoogleFonts.acme(textStyle:TextStyle(fontSize: 25, color: Colors.white, fontWeight:FontWeight.w500 )),),
                ),
              ],
            )
          ),
        ),
      ),
    ));
  }
}
