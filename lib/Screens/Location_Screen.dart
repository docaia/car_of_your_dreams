import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/widgets/Manufacturers.dart';
import 'package:car_of_your_dreams/widgets/CarModels.dart';
import 'package:car_of_your_dreams/Services/carModelsLists.dart';
import 'package:car_of_your_dreams/widgets/carGoodandBadThings.dart';

class ShowLocation extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed:(){

                    Navigator.pushNamed(context, '1');
                  },
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.lightGreen) ),
                      child: Text("Back to Home")),
                ],
              ),
            ),
            Text('Choose a car to know its rating, mechanics and more!', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),),
            Expanded(child: CarDropDown())
          ],
        )
      )
    );

  }
}
class CarDropDown extends StatefulWidget {

  @override

  _CarDropDownState createState() => _CarDropDownState();
}
class _CarDropDownState extends State<CarDropDown> {
  Manufacturers? selectedManu;
  List<CarModel>?modelsforManu = [];
  bool isVisible = false;
  CarModel? selectedModel;
  var dropdownValue;
  var dropdownModel;
  var dropdownYear;
  String? agency;
  String? agencyWebSite;
  String? agencyPhone;
  String? agencyRating;
  String? firstGood;
  String? secondGood;
  String? thirdGood;
  String? firstBad;
  String? secondBad;
  String? thirdBad;

  late List<Manufacturers> cars;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cars =[Manufacturers('Toyota', mToyota),Manufacturers('JEEP', mJEEP), Manufacturers('KIA', mKIA), Manufacturers('FIAT', mFIAT), Manufacturers('Hyundai', mHyundai), Manufacturers('Mercedes', mMercedes),Manufacturers('BMW', mBMW), Manufacturers('SEAT', mSEAT), Manufacturers('VolksWagen', mVolksWagen)];
  }
  @override


  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<Manufacturers>(
                value: dropdownValue,
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
                        color: Colors.greenAccent,
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
                        color: Colors.greenAccent,
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
                icon: Icon(Icons.timer),
                style:TextStyle(color: Colors.black) ,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownYear = newValue;

                  });
                },
                items: years.map((String item){
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Container(
                        color: Colors.greenAccent,
                        child: Text(item)),
                  );
                }
                ).toList()
            ),
          ),
        ],),

        ElevatedButton(onPressed: () async {
          var carFetchedData= await MySQL().extractCarDetails(selectedManu?.name);
          var carBest = await MySQL().extractBestWorst(selectedManu?.name, dropdownModel.name, dropdownYear);
          print(carBest);
          List<GoodAndBad> theGood=[
            GoodAndBad('Good dependability, no unexpected problems', int.parse(carBest['No_Unexpected_problems']) ),
            GoodAndBad('Stable at high speeds', int.parse(carBest['Stable_at_high_speeds']) ),
            GoodAndBad('Good acceleration', int.parse(carBest['Good_acceleration']) ),
            GoodAndBad('Big storage spaces', int.parse(carBest['Big_storage_space']) ),
            GoodAndBad('Comfortable and large seats', int.parse(carBest['Comfortable_and_large_seats']) ),
            GoodAndBad('Efficient fuel consumption', int.parse(carBest['Efficient_consumption']) ),
          ];
          theGood.sort((b,a)=>a.score!.compareTo(b.score!));

          List<GoodAndBad> theBad =[
            GoodAndBad('Noisy, not good isolation', int.parse(carBest['Noisy']) ),
            GoodAndBad('Weak breaks', int.parse(carBest['Brakes_are_Weak']) ),
            GoodAndBad('Not good cooling, heats up', int.parse(carBest['Heat_Issues']) ),
            GoodAndBad('Not stable at high speeds', int.parse(carBest['Not_stable_at_high_speeds']) ),
            GoodAndBad('Slow acceleration and some lag in shifts', int.parse(carBest['Too_slow_acceleration']) ),
            GoodAndBad('Too close to the ground', int.parse(carBest['Too_close_to_ground']) ),
            GoodAndBad('Tight, uncomfortable seats', int.parse(carBest['Tight_seats']) ),
            GoodAndBad('Small storage spaces', int.parse(carBest['Small_storage_space']) ),
            GoodAndBad('High fuel consumption', int.parse(carBest['High_Fuel_consumption']) ),
          ];

          theBad.sort((b,a)=>a.score!.compareTo(b.score!));

          setState(() {
            isVisible = true;
            agency = carFetchedData['Agency'];
            agencyWebSite = carFetchedData['Site'];
            agencyPhone = carFetchedData['Phone'];
            agencyRating = carFetchedData['Agency_Rating'];
            firstGood = theGood[0].name;
            secondGood = theGood[1].name;
            thirdGood = theGood[2].name;
            firstBad = theBad[0].name;
            secondBad = theBad[1].name;
            thirdBad = theBad[2].name;
          });

        },
          child: Text('Tell me all about this car!'),
        ),
        //TODO 1: build a container for the information
        //TODO 2: Go to the database and grab the information for the selected car
        Visibility(
          visible: isVisible,
          child: Container(
            height: MediaQuery.of(context).size.height/1.5,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: ListView.builder(
    itemCount: 1,
itemBuilder: (BuildContext context, int index){
return Column(
  mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
RichText(text: TextSpan(text: 'Agency: ', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
    children:<TextSpan>[
      TextSpan(text: agency, style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
    ])
),
  RichText(text: TextSpan(text: 'Agency web site: ', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
  children:<TextSpan>[
  TextSpan(text: agencyWebSite, style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
    TextSpan(text: ' Phone: ', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),),
    TextSpan(text: agencyPhone, style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  ])),
  RichText(text: TextSpan(text: 'Agency Rating:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
      children:<TextSpan>[
          TextSpan(text: agencyRating, style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) ))
      ])
  ),

  RichText(text: TextSpan(text: 'Car Rating:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
      children:<TextSpan>[
          TextSpan(text:' 4', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) ))
      ])
  ),

  RichText(text: TextSpan(text: 'Best of this car:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
      ),
  ),
  Text('    1- $firstGood', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  Text('    2- $secondGood', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  Text('    3- $thirdGood', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),

  RichText(text: TextSpan(text: 'Worst Problems:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
  ),),
  Text('    1- $firstBad', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  Text('    2- $secondBad', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  Text('    3- $thirdBad', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  RichText(text: TextSpan(text: 'Maintenance cost 0-100,000Km:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
      children:<TextSpan>[
          TextSpan(text:' 58,000 EGP', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) ))
      ])
  ),
  RichText(text: TextSpan(text: 'Best Mechanics for the car:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
  ),),
  RichText(text: TextSpan(text: 'Name:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
  children:<TextSpan>[
  TextSpan(text:' Fathy Tito', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  TextSpan(text:' Rating', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) )),
    TextSpan(text:' 4.5', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) )),

  ]),
  ),
],
);

}
),
          ),
        )
      ],
    );
  }


}

//


