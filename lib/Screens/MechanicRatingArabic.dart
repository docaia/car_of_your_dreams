import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/widgets/MechanicInformation.dart';
import 'package:location/location.dart';
import 'package:car_of_your_dreams/widgets/Manufacturers.dart';
import 'package:car_of_your_dreams/widgets/CarModels.dart';
import 'package:car_of_your_dreams/Services/carModelsLists.dart';
import 'package:rive/rive.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MechanicRating extends StatefulWidget {
  @override
  MechanicRating({this.issueDescribe, this.toScreenNum, this.rightButtonText, required this.goodOrBadList, this.selectedIssue});
  final String? issueDescribe;
  final String? toScreenNum;
  final String? rightButtonText;
  final String? selectedIssue;

  final List<String> goodOrBadList;

  @override
  State<MechanicRating> createState() => _BestMechanicScreenState();
}

class _BestMechanicScreenState extends State<MechanicRating> {
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
  Manufacturers? selectedManu;
  List<CarModel>?modelsforManu = [];
  CarModel? selectedModel;
  var dropdownValue;
  var dropdownModel;
  var dropdownYear;
  bool isVisible = false;
  bool firstMapViz = false;
  bool secondMapViz = false;
  late List<Manufacturers> cars;
  int mRate=3;
  Db db = Db();
  LatLng latlongScreen=LatLng(30.037045, 31.247992);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cars =[Manufacturers('Toyota', mToyota),Manufacturers('JEEP', mJEEP), Manufacturers('KIA', mKIA), Manufacturers('FIAT', mFIAT), Manufacturers('Honda', mHonda),Manufacturers('Hyundai', mHyundai), Manufacturers('Mercedes', mMercedes),Manufacturers('BMW', mBMW), Manufacturers('SEAT', mSEAT), Manufacturers('VolksWagen', mVolksWagen), Manufacturers('Peugeot', mPeugeot), Manufacturers('Nissan', mNissan), Manufacturers('Suzuki', mSuzuki),];
  }

  Widget build(BuildContext context) {
    MechanicInformation mn=MechanicInformation((value)=>mechanicName=value, "الميكانيكي", "الإسم     ", TextInputType.name, [FilteringTextInputFormatter.singleLineFormatter]);
    MechanicInformation mp=MechanicInformation((value)=>mechanicPhone=value, "تليفون", "تليفون   ", TextInputType.phone, [FilteringTextInputFormatter.digitsOnly]);
    MechanicInformation ml=MechanicInformation((value)=>mechanicLocation=value, "عنوان أو منطقه", "فين  ", TextInputType.streetAddress, [FilteringTextInputFormatter.singleLineFormatter]);
    MechanicInformation ws=MechanicInformation((value)=>workshopName = value, "الورشه", "الورشه ", TextInputType.name, [FilteringTextInputFormatter.singleLineFormatter]);
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
      child: Scaffold(backgroundColor: Colors.blue[400],
        body: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(color: Colors.blue[400]),
          child: Row(
            children: [
              Expanded(
                flex:2,
                child: Column(
                  children: [
                    Container( decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Padding(
                        padding: const EdgeInsets.only(right:16, top:8),
                        child: Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                height: MediaQuery.of(context).size.height*0.1,
                                child: Image.asset('Images/CarKenz4.gif')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(onPressed:(){

                                  Navigator.pushNamed(context, '1');
                                },
                                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.lightBlueAccent) ),
                                    child: Text(" شوف إحصائيات أكثر (تجريبي)")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Text(widget.issueDescribe!, style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          backgroundColor: Colors.blue[400],
                          color: Colors.black,
                          fontSize: 25,
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
                              child: Text("تخصصه", style: TextStyle(fontWeight: FontWeight.w900)),
                            ),
                          ),
                          SizedBox(width: 35,),
                          Text("ميكانيكا"),
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
                          Text("كهرباء"),
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
                          Text("سمكره"),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,0,10,0),
                      child: Row(
                        children: [
                          Text('العربيه', style: TextStyle(fontWeight: FontWeight.w900)),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50,0,10,0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,50,0),
                              child: Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<Manufacturers>(
                                      value: dropdownValue,
                                      hint:Text('الصانع', style: TextStyle(fontWeight: FontWeight.w700)),
                                      icon: Icon(Icons.precision_manufacturing_outlined),
                                      style:TextStyle(color: Colors.black) ,
                                      onChanged: (Manufacturers? newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                          selectedManu = dropdownValue;
                                          dropdownModel = null;
                                          modelsforManu= selectedManu?.models;
                                          isVisible = false;

                                        });
                                      },
                                      items: cars.map((Manufacturers item){
                                        return DropdownMenuItem<Manufacturers>(
                                          value: item,
                                          child: Container(
                                              color: Colors.blue[300],
                                              child: Text(item.name)),
                                        );
                                      }
                                      ).toList()
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<CarModel>(
                                      value: dropdownModel,
                                      hint:Text('الطراز', style: TextStyle(fontWeight: FontWeight.w700)),
                                      icon: Icon(Icons.category),
                                      style:TextStyle(color: Colors.black) ,
                                      onChanged: (CarModel? newValue) {
                                        setState(() {
                                          dropdownModel = newValue;
                                          isVisible = false;

                                        });
                                      },
                                      items: modelsforManu?.map((CarModel item){
                                        return DropdownMenuItem<CarModel>(
                                          value: item,
                                          child: Container(
                                              color: Colors.blue[300],
                                              child: Text(item.name)),
                                        );
                                      }
                                      ).toList()
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<String>(
                                      value: dropdownYear,
                                      hint:Text('السنه', style: TextStyle(fontWeight: FontWeight.w700)),
                                      icon: Icon(Icons.timer),
                                      style:TextStyle(color: Colors.black) ,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownYear = newValue;
                                          isVisible = false;

                                        });
                                      },
                                      items: years.map((String item){
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Container(
                                              color: Colors.blue[300],
                                              child: Text(item)),
                                        );
                                      }
                                      ).toList()
                                  ),
                                ),
                              ],),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                latlongScreen = LatLng(lati!.toDouble(),longi!.toDouble());
                              });

                              print(loc);
                            },
                            child: Text('سجل المكان من الخرائط', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black))
                        ),
                      ),
                    )),
                    Visibility(
                      visible: mapViz,
                      child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child:
                          GoogleMap(
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(lati!.toDouble(), longi!.toDouble()),
                              zoom: 14.4746,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              controller.getScreenCoordinate(latlongScreen);
                              print(latlongScreen);
                              mapViz=true;
                            },
                            markers: {
                              Marker(markerId: MarkerId('${mechanicName}'),
                                  draggable: true,
                              position: LatLng(lati!.toDouble(),longi!.toDouble()),
                                onDrag: (markerLocation){
                                latlongScreen = markerLocation;
                                print(latlongScreen);
                                }


                                
                              )
                            }
                          ),
                          //FlutterLocationPicker(
                          //     initPosition: LatLong(lati!.toDouble(), longi!.toDouble()),
                          //     initZoom: 11,
                          //     minZoomLevel: 5,
                          //     maxZoomLevel: 16,
                          //     trackMyPosition: true,
                          //     onPicked: (pickedData) {
                          //       print(pickedData.latLong.latitude);
                          //       print(pickedData.latLong.longitude);
                          //       print(pickedData.address);
                          //       print(pickedData.addressData['country']);
                          //       setState(() {
                          //         Timer(Duration(milliseconds: 3000),(){
                          //           mapViz = false;
                          //         });
                          //       });
  //}
                              )
                        //GoogleMap(lati,longi,"7", "Location you captured")
                      ),

          Padding(
            padding: const EdgeInsets.fromLTRB(50,0,10,0),
            child: Row(
              children: [
                Text('إيه رأيك؟', style: TextStyle(fontWeight: FontWeight.w900)),
                RatingBar.builder(
                    initialRating: 1,
                    itemCount: 5,
                    itemSize: 50,
                    unratedColor: Colors.blueAccent,
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
                      mRate = rating.toInt();
                    },
                ),
              ],
            ),
          ),
                    Container(

                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget> [
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(8.0,0,0,8),
                            //   child: TextButton(onPressed: (){
                            //     Navigator.pushNamed(context, 'mechResults');
                            //   },
                            //       style: ButtonStyle(side: MaterialStateProperty.all(BorderSide() )),
                            //       child: Text("قائمة الأفضل", style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),)),
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,8,8),
                              child: TextButton(onPressed: ()async{
Provider.of<CarsProvider>(context,listen: false).topMechs= await MySQL().getTopMechanics();
                                if(isMechanic == true && isElectric == true && isCarBodyFix==true){specialty ="Mechanic, Electrician, Samkary";}
                                else if(isMechanic == true && isElectric==true){specialty ="Mechanic, Electrician";}
                                else if(isMechanic == true ){specialty ="Mechanic";}
                                else if(isElectric == true){specialty ="Electrician";}
                                else if(isCarBodyFix == true){specialty ="Samkary";}
                                print(specialty);
                                Navigator.pushNamed(context, 'mechResults');
                                var mechSend = await MySQL().mechanicInfo(
                                  mechanicName!.toUpperCase(),
                                  workshopName!,
                                  mechanicPhone!,
                                  mechanicLocation!.toUpperCase(),
                                  selectedManu!.name,
                                  dropdownModel.name,
                                  dropdownYear,
                                  specialty!,
                                  latlongScreen.latitude.toString(),//lati!.toString(),
                                  latlongScreen.latitude.toString(),//longi!.toString(),
                                  mRate.toString(),
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
              Expanded(
                flex:1,
                child:RiveAnimation.asset('mechanic1.riv'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


