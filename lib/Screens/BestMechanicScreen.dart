import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/widgets/MechanicInformation.dart';
import 'package:location/location.dart';
import 'package:car_of_your_dreams/widgets/googleMaps.dart';


class BestMechanicScreen extends StatefulWidget {
  @override
  BestMechanicScreen({this.issueDescribe, this.toScreenNum, this.rightButtonText, required this.goodOrBadList, this.selectedIssue});
  final String? issueDescribe;
  final String? toScreenNum;
  final String? rightButtonText;
  final String? selectedIssue;

  final List<String> goodOrBadList;

  @override
  State<BestMechanicScreen> createState() => _BestMechanicScreenState();
}

class _BestMechanicScreenState extends State<BestMechanicScreen> {
  String? mechanicName;

  String? mechanicPhone;

  String? mechanicLocation;

  String? workshopName;
  bool isMechanic = false;
  bool isElectric = false;
  bool isCarBodyFix=false;
   String? specialty;
  num? lati =0;
  num? longi= 0;
  bool mapViz = false;
  int rateMech=3;
  Db db = Db();

  Widget build(BuildContext context) {
    MechanicInformation mn=MechanicInformation((value)=>mechanicName=value, "Mechanic's name", "Name     ", TextInputType.name, [FilteringTextInputFormatter.singleLineFormatter]);
    MechanicInformation mp=MechanicInformation((value)=>mechanicPhone=value, "Mechanic's phone number", "Phone   ", TextInputType.phone, [FilteringTextInputFormatter.digitsOnly]);
    MechanicInformation ml=MechanicInformation((value)=>mechanicLocation=value, "Mechanic's Location", "Address", TextInputType.streetAddress, [FilteringTextInputFormatter.singleLineFormatter]);
    MechanicInformation ws=MechanicInformation((value)=>workshopName = value, "Name of the workshop", "Workshop", TextInputType.name, [FilteringTextInputFormatter.singleLineFormatter]);
    Location location = new Location();
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

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
              Text(widget.issueDescribe!, style: GoogleFonts.publicSans(
                textStyle: TextStyle(
                    backgroundColor: Colors.blueAccent,
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none

                ),),
              ),
              Expanded(child: mn),
              Expanded(child: ws),
              Expanded(child: mp),
              Expanded(child: ml),
              Expanded(child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
                      child: Text("Specialty", style: TextStyle(fontWeight: FontWeight.w900)),
                    ),
                  ),
                  SizedBox(width: 35,),
                  Text("Mechanic"),
                       Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isMechanic,
                          onChanged: (bool? value) {
                            setState(() {
                              isMechanic = value!;
                                                          });
                          }),
                  SizedBox(width: 15,),
                  Text("Electrician"),
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isElectric,
                      onChanged: (bool? value) {
                        setState(() {
                          isElectric = value!;
                        });
                      }),
                  SizedBox(width: 15,),
                  Text("Plumber - car body"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,50,0),
                    child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCarBodyFix,
                        onChanged: (bool? value) {
                          setState(() {
                            isCarBodyFix = value!;
                          });
                        }),
                  ),
                ]
              )),
              Expanded(child:Padding(
                padding: const EdgeInsets.fromLTRB(40,0,0,0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () async{
var loc= await location.getLocation();
setState(() {
  mapViz = true;
  lati = loc.latitude;
  longi = loc.longitude;

});

print(loc);
                    },
                    child: Text('Capture location from maps', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black))
                  ),
                ),
              )),
              Visibility(
                visible: mapViz,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child:GoogleMap(lati,longi,"7", "Location you captured")
                ),
              ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50,0,10,0),
          child: Row(
            children: [
              Text('Mechanic Rating', style: TextStyle(fontWeight: FontWeight.w900)),
              RatingBar.builder(
                initialRating: 1,
                itemCount: 5,
                itemSize: 50,
                unratedColor: Colors.blue[300],
                itemPadding: EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Image.asset(
                          '/Images/heart1.png'
                      );
                    case 1:
                      return Image.asset(
                          '/Images/heart2.png'
                      );
                    case 2:
                      return Image.asset(
                          '/Images/heart3.png'
                      );
                    case 3:
                      return Image.asset(
                          '/Images/heart4.png'
                      );
                    case 4:
                      return Image.asset(
                          '/Images/heart5.png'
                      );
                  } return Container();
                },
                onRatingUpdate: (rating) {
                  print(rating);
                  rateMech = rating.toInt();
                },
              ),
              ],
          ),
        ),
              Container(

                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,0,0,8),
                        child: TextButton(onPressed: (){
                          Navigator.pushNamed(context, widget.toScreenNum!);
                        },
                            style: ButtonStyle(side: MaterialStateProperty.all(BorderSide() )),
                            child: Text("Skip", style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,8,8),
                        child: TextButton(onPressed: ()async{

if(isMechanic == true && isElectric == true && isCarBodyFix==true){specialty ="Mechanic, Electrician, Samkary";}
else if(isMechanic == true && isElectric==true){specialty ="Mechanic, Electrician";}
else if(isMechanic == true ){specialty ="Mechanic";}
else if(isElectric == true){specialty ="Electrician";}
else if(isCarBodyFix == true){specialty ="Samkary";}
  print(specialty);
   Navigator.pushNamed(context, widget.toScreenNum!);
  var mechSend = await MySQL().mechanicInfo(
      mechanicName!.toUpperCase(),
      workshopName!,
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
          .data!,
      specialty!,
    lati!.toString(),
    longi!.toString(),
    rateMech!.toString(),
  );
  print(mechSend);
  print("mechanic is $mechanicName");

                        },
                            style: ButtonStyle(side: MaterialStateProperty.all(BorderSide() )),
                            child: Text(widget.rightButtonText!, style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),)),
                      )

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


