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
  String? maintenanceCost;
  String? carRating;
  String? firstGood;
  String? secondGood;
  String? thirdGood;
  String? firstBad;
  String? secondBad;
  String? thirdBad;
  String? firstMechanicName;
  String? firstMechanicPhone;
  String? firstMechanicLocation;
  String? secondMechanicName;
  String? secondMechanicPhone;
  String? secondMechanicLocation;
  String? thirdMechanicName;
  String? thirdMechanicPhone;
  String? thirdMechanicLocation;
  late List<GoodAndBad> theGood;
  late List<GoodAndBad> theBad;
  late List<Manufacturers> cars;
  dynamic mechss;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cars =[Manufacturers('Toyota', mToyota),Manufacturers('JEEP', mJEEP), Manufacturers('KIA', mKIA), Manufacturers('FIAT', mFIAT), Manufacturers('Hyundai', mHyundai), Manufacturers('Mercedes', mMercedes),Manufacturers('BMW', mBMW), Manufacturers('SEAT', mSEAT), Manufacturers('VolksWagen', mVolksWagen), Manufacturers('Peugeot', mPeugeot), Manufacturers('Nissan', mNissan),];
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
                    mechss = null;
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
                    mechss = null;
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
                    isVisible = false;
                    mechss = null;
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
          if(carBest=="no data, something went wrong"){
            print("only updating agency details");
          } else {
             theGood = [
              GoodAndBad('Good dependability, no unexpected problems',
                  int.parse(carBest['No_Unexpected_problems'])),
              GoodAndBad('Stable at high speeds',
                  int.parse(carBest['Stable_at_high_speeds'])),
              GoodAndBad(
                  'Good acceleration', int.parse(carBest['Good_acceleration'])),
              GoodAndBad('Big storage spaces',
                  int.parse(carBest['Big_storage_space'])),
              GoodAndBad('Comfortable and large seats',
                  int.parse(carBest['Comfortable_and_large_seats'])),
              GoodAndBad('Efficient fuel consumption',
                  int.parse(carBest['Efficient_consumption'])),
            ];
            theGood.sort((b, a) => a.score!.compareTo(b.score!));

            theBad = [
              GoodAndBad(
                  'Noisy, not good isolation', int.parse(carBest['Noisy'])),
              GoodAndBad('Weak breaks', int.parse(carBest['Brakes_are_Weak'])),
              GoodAndBad('Not good cooling, heats up',
                  int.parse(carBest['Heat_Issues'])),
              GoodAndBad('Not stable at high speeds',
                  int.parse(carBest['Not_stable_at_high_speeds'])),
              GoodAndBad('Slow acceleration and some lag in shifts',
                  int.parse(carBest['Too_slow_acceleration'])),
              GoodAndBad('Too close to the ground',
                  int.parse(carBest['Too_close_to_ground'])),
              GoodAndBad('Tight, uncomfortable seats',
                  int.parse(carBest['Tight_seats'])),
              GoodAndBad('Small storage spaces',
                  int.parse(carBest['Small_storage_space'])),
              GoodAndBad('High fuel consumption',
                  int.parse(carBest['High_Fuel_consumption'])),
            ];

            theBad.sort((b, a) => a.score!.compareTo(b.score!));
          };
 mechss = await MySQL().getMechanicsForMyCar(selectedManu?.name, dropdownModel.name, dropdownYear);
print(mechss);//[0]['location']);

          setState(() {
            isVisible = true;
            agency = carFetchedData['Agency'];
            agencyWebSite = carFetchedData['Site'];
            agencyPhone = carFetchedData['Phone'];
            agencyRating = carFetchedData['Agency_Rating'];
            maintenanceCost = carBest== "no data, something went wrong"? 'no data yet': carBest['HundredK'];
            carRating = carBest== "no data, something went wrong"? 'not rated yet': carBest['Rating_all'];
            if(carBest =="no data, something went wrong"){
              firstGood = "nothing yet";
              secondGood = "nothing yet";
              thirdGood = "nothing yet";
              firstBad = "nothing yet";
              secondBad = "nothing yet";
              thirdBad = "nothing yet";
            } else {
              firstGood = theGood[0].name;
              secondGood = theGood[1].name;
              thirdGood = theGood[2].name;
              firstBad = theBad[0].name;
              secondBad = theBad[1].name;
              thirdBad = theBad[2].name;
            };
            if(mechss!="no mechanics aslan") {
              firstMechanicName = mechss[0]['mechanic'];
              firstMechanicPhone = mechss[0]['phone'];
              firstMechanicLocation = mechss[0]['location'];
            }
             if(mechss is List && mechss.asMap().containsKey(1)){
                secondMechanicName = mechss[1]['mechanic'];
                secondMechanicPhone = mechss[1]['phone'];;
                secondMechanicLocation = mechss[1]['location'];
            }
            if(mechss=="no mechanics aslan"){
              firstMechanicName = "";
              firstMechanicPhone = "";
              firstMechanicLocation ="";
              secondMechanicName = "";
              secondMechanicPhone = "";
              secondMechanicLocation = "";
            };

          });

        },
          child: Text('Tell me all about this car!'),
        ),

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
          TextSpan(text: '$agencyRating /5', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) ))
      ])
  ),

  RichText(text: TextSpan(text: 'Car Rating:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
      children:<TextSpan>[
          TextSpan(text:'$carRating /5', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) ))
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
          TextSpan(text:' $maintenanceCost EGP', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.purple, fontWeight:FontWeight.w500 ) ))
      ])
  ),
  SizedBox(height: 10,),
  RichText(text: TextSpan(text: 'Best Mechanics for the car:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 30, color: Colors.white, fontWeight:FontWeight.w500 ) ),
  ),),
  RichText(text: TextSpan(text: 'Name:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 27, color: Colors.white, fontWeight:FontWeight.w500 ) ),
  children:<TextSpan>[
  TextSpan(text:' $firstMechanicName', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  TextSpan(text:' Phone', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 27, color: Colors.white, fontWeight:FontWeight.w500 ) )),
    TextSpan(text:' $firstMechanicPhone', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
    TextSpan(text:' Location', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 27, color: Colors.white, fontWeight:FontWeight.w500 ) )),
    TextSpan(text:' $firstMechanicLocation', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
  ]),
  ),
  RichText(text: TextSpan(text: 'Name:', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 27, color: Colors.white, fontWeight:FontWeight.w500 ) ),
      children:<TextSpan>[
        TextSpan(text:' $secondMechanicName', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
        TextSpan(text:' Phone', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 27, color: Colors.white, fontWeight:FontWeight.w500 ) )),
        TextSpan(text:' $secondMechanicPhone', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
        TextSpan(text:' Location', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 27, color: Colors.white, fontWeight:FontWeight.w500 ) )),
        TextSpan(text:' $secondMechanicLocation', style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 23, color: Colors.purple, fontWeight:FontWeight.w500 ) )),
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


