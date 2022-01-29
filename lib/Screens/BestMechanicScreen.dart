import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/widgets/MechanicInformation.dart';

class BestMechanicScreen extends StatelessWidget {
  @override
  BestMechanicScreen({this.issueDescribe, this.toScreenNum, this.rightButtonText, required this.goodOrBadList, this.selectedIssue});
  final String? issueDescribe;
  final String? toScreenNum;
  final String? rightButtonText;
  final String? selectedIssue;

  final List<String> goodOrBadList;
  String? mechanicName;
  String? mechanicPhone;
  String? mechanicLocation;
  Db db = Db();

  Widget build(BuildContext context) {
    MechanicInformation mn=MechanicInformation((value)=>mechanicName=value, "Mechanic's name", "Name");
    MechanicInformation mp=MechanicInformation((value)=>mechanicPhone=value, "Mechanic's phone number", "Phone");
    MechanicInformation ml=MechanicInformation((value)=>mechanicLocation=value, "Mechanic's Location", "Location");
    return Material(
      child: Scaffold(backgroundColor: Colors.blueAccent,
        body: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Column(
            children: [
              Container( decoration: BoxDecoration(color: Colors.blueAccent),
                child: Padding(
                  padding: const EdgeInsets.only(right:16, top:8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed:(){

                        Navigator.pushNamed(context, '1');
                      },
                          style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.lightBlueAccent) ),
                          child: Text("Back to Home")),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    text: ' ${Provider
                        .of<CarsProvider>(context, listen: true)
                        .currentCarManufacturer
                        .data}',
                    style: GoogleFonts.eastSeaDokdo(textStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                    children: <TextSpan>[
                      TextSpan(text: '  ${Provider
                          .of<CarsProvider>(context, listen: false)
                          .myModel
                          .data}',
                        style: GoogleFonts.ubuntu(textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400)),),
                      TextSpan(text: '  ${Provider
                          .of<CarsProvider>(context, listen: false)
                          .myYear
                          .data}',
                        style: GoogleFonts.ubuntu(textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400)),),
                    ],),
                ),
              ),
              Text(issueDescribe!, style: GoogleFonts.publicSans(
                textStyle: TextStyle(
                    backgroundColor: Colors.blueAccent,
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none

                ),),
              ),
              Expanded(child: mn),
              Expanded(child: mp),
              Expanded(child: ml),
              Container(

                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, toScreenNum!);
                      },
                          child: Text("Skip", style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white)),)),
                      TextButton(onPressed: ()async{
print(Provider.of<CarsProvider> (context, listen: false).mech);

  Navigator.pushNamed(context, toScreenNum!);
  var mechSend = await MySQL().mechanicInfo(
      mechanicName!.toUpperCase(),
      mechanicPhone!,
      mechanicLocation!.toUpperCase(),
      Provider
          .of<CarsProvider>(context, listen: false)
          .currentCarManufacturer
          .data!,
      Provider
          .of<CarsProvider>(context, listen: false)
          .myModel
          .data!,
      Provider
          .of<CarsProvider>(context, listen: false)
          .myYear
          .data!
  );
  print(mechSend);
  print("mechanic is $mechanicName");

                      },
                          child: Text(rightButtonText!, style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),))

                    ]
                ),

              )

            ],
          ),
        ),
      ),
    );
  }


  }


