import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/widgets/starButton.dart';
import 'package:car_of_your_dreams/widgets/StarRating_toggle.dart';
import 'package:car_of_your_dreams/widgets/StarPressing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CarSelection extends StatelessWidget {
  StarRatingToggle mytoggle = StarRatingToggle();
  var _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    List<Text> theModel = [];
    return Consumer<CarsProvider>(builder: (context, carData, child){
//      void starTap(bool star){
//        carData.falseAll();
//        carData.starStatusChange(star);
//        star = carData.myToggle.isChecked;
//      }

      return Column(
      children: <Widget>[
        Expanded(
          child: Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    //manufacturers
                    child: CupertinoPicker(
                      itemExtent: 32,
                      backgroundColor: Colors.blueAccent,
                      onSelectedItemChanged: (manu) {
                        carData.manufacturers[manu];
                        carData.currentCarManufacturer =
                            carData.manufacturers[manu];
                        print(carData.currentCarManufacturer.data);

                        theModel = carData
                            .modelSelection(carData.currentCarManufacturer);
                        print(theModel);
                      },
                      children: carData.manufacturers,
                    ),
                  ),
                  Expanded(
                      //Models
                      child: CupertinoPicker(
                          itemExtent: 32,
                          backgroundColor: Colors.blueAccent,
                          onSelectedItemChanged: (model) {
                            theModel[model];
                          },
                          children: carData
                              .modelSelection(carData.currentCarManufacturer)
//                                        carData.modelSelection(carData.currentCarManufacturer),
                          )),
                  Expanded(
                      //year
                      child: CupertinoPicker(
                    itemExtent: 32,
                    backgroundColor: Colors.blueAccent,
                    onSelectedItemChanged: (year) {
                      carData.year[year];
                    },
                    children: carData.year,
                  )),
                ],
              ),
            ),

        ),
        Expanded(
          child: Container(
    padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex:2,
                    child: Text(
                  "Car maintenance center performance",
                  style: GoogleFonts.publicSans(
                    textStyle: TextStyle(
                      backgroundColor: Colors.blueAccent,
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none

                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
//StreamBuilder<QuerySnapshot>(
//  stream: _firestore.collection('car').snapshots(),
//    builder: (context, snapshot) {
//      if (snapshot.hasData) {
//        final car_rate = snapshot.data.documents.reversed;
//        List<Text> carsMan = [];
//        for (var i in car_rate) {
//          final carMan = i.data['man'];
//
//          carsMan.add(carMan);
//          print(carsMan);
//        }
//        return Text(carsMan[0].toString());
//      }
//    }
//),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Colors.blueAccent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
    Expanded(
    child: FlatButton(
    child: StarButton(starColor: carData.star1IsChecked? Colors.black: Color(0xFFFFFACD), starLabel: "1",),

    onPressed: () {
      carData.falseAll();
      carData.starStatusChange(carData.star1IsChecked);
        carData.star1IsChecked = carData.myToggle.isChecked;
      print("my kingdom is ${carData.star1IsChecked}");
      },
    )),
    //
    Expanded(
    child: FlatButton(
      child: StarButton(starColor: carData.star2IsChecked? Colors.black: Color(0xFFFFF77D), starLabel: "2",),
    onPressed: () {
      carData.falseAll();
      carData.starStatusChange(carData.star2IsChecked);
      carData.star2IsChecked = carData.myToggle.isChecked;

    },
    )),
    Expanded(
    child: FlatButton(
      child: StarButton(starColor:carData.star3IsChecked? Colors.black: Color(0xFFFFEE75), starLabel: "3",),
    onPressed: () {
      carData.falseAll();
      carData.starStatusChange(carData.star3IsChecked);
      carData.star3IsChecked = carData.myToggle.isChecked;
    },
    )),
    Expanded(
    child: FlatButton(
      child: StarButton(starColor: carData.star4IsChecked? Colors.black:Color(0xFFFFDF00), starLabel: "4",),
    onPressed: () {
      carData.falseAll();
      carData.starStatusChange(carData.star4IsChecked);
      carData.star4IsChecked = carData.myToggle.isChecked;
    },
    )),
    Expanded(   child: FlatButton(
      child: StarButton(starColor: carData.star5IsChecked? Colors.black:Color(0xFFFFFF00), starLabel: "5",),
    onPressed: () {
      carData.falseAll();
      carData.starStatusChange(carData.star5IsChecked);
      carData.star5IsChecked = carData.myToggle.isChecked;
    },
    )),
              ],
            ),
          ),
        )
      ],
    );
    });
  }
}



