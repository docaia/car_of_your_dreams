import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/widgets/starButton.dart';
import 'package:car_of_your_dreams/widgets/StarRating_toggle.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';
import '../widgets/Constants.dart';


class CarSelection extends StatelessWidget {


  StarRatingToggle mytoggle = StarRatingToggle();
  Db db = Db();
  int currentUserRating;
  int existingRating;
  List currentModel=[];
  String carModel;
  String carMan;

  String yearOfMan;
  @override
  Widget build(BuildContext context) {
    List<Text> theModel = [];
    return Consumer<CarsProvider>(builder: (context, carData, child) {
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
                        carMan = carData.currentCarManufacturer.data;
//
                        print(carMan);


                        currentModel = carData
                            .modelSelection(carData.currentCarManufacturer);
                        carData.models = currentModel;
//print(carData.models);
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
                          carData.models[model];
                          carData.myModel = carData.models[model];
                          carModel = carData.myModel.data;
                          print(carModel);
                        },
//                          children: carData.modelSelection(carData.currentCarManufacturer)
                        children: carData.models,

                      )),
                  Expanded(
                    //year
                      child: CupertinoPicker(
                        itemExtent: 32,
                        backgroundColor: Colors.blueAccent,
                        onSelectedItemChanged: (year) {
                          carData.year[year];
                          carData.myYear = carData.year[year];
                          yearOfMan = carData.myYear.data;
                          print(yearOfMan);
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
                      flex: 2,
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
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.blueAccent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: FlatButton(
                        child: StarButton(starColor: carData.star1IsChecked
                            ? Colors.black
                            : Color(0xFFFFFACD), starLabel: "1",),

                        onPressed: () {
                          ApplyRating(carData, 1);
                          carData.starStatusChange(carData.star1IsChecked);
                          carData.star1IsChecked = carData.myToggle.isChecked;
                        },
                      )),
                  //
                  Expanded(
                      child: FlatButton(
                        child: StarButton(starColor: carData.star2IsChecked
                            ? Colors.black
                            : Color(0xFFFFF77D), starLabel: "2",),
                        onPressed: () {
                          ApplyRating(carData, 2);
                          carData.starStatusChange(carData.star2IsChecked);
                          carData.star2IsChecked = carData.myToggle.isChecked;
                        },
                      )),
                  Expanded(
                      child: FlatButton(
                        child: StarButton(starColor: carData.star3IsChecked
                            ? Colors.black
                            : Color(0xFFFFEE75), starLabel: "3",),
                        onPressed: () {
                          ApplyRating(carData, 3);
                          carData.starStatusChange(carData.star3IsChecked);
                          carData.star3IsChecked = carData.myToggle.isChecked;
                        },
                      )),
                  Expanded(
                      child: FlatButton(
                        child: StarButton(starColor: carData.star4IsChecked
                            ? Colors.black
                            : Color(0xFFFFDF00), starLabel: "4",),
                        onPressed: () {
                          ApplyRating(carData, 4);
                          carData.starStatusChange(carData.star4IsChecked);
                          carData.star4IsChecked = carData.myToggle.isChecked;
                        },
                      )),
                  Expanded(child: FlatButton(
                    child: StarButton(starColor: carData.star5IsChecked ? Colors
                        .black : Color(0xFFFFFF00), starLabel: "5",),
                    onPressed: () {
                      ApplyRating(carData, 5);
                      carData.starStatusChange(carData.star5IsChecked);
                      carData.star5IsChecked = carData.myToggle.isChecked;
                    },
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                color: Colors.blueAccent,
                child: Row(children: <Widget>[
                  Text("Your Rating: $currentUserRating",
                    style: TextStyle(fontSize: 12, color: Colors.white),),
                  SizedBox(width: 5,),
                  Text("Overall community: ${carData.communityRating}",
                      style: TextStyle(fontSize: 12, color: Colors.white))
                ],)

            ),
          ),
        ],


      );

    },

    );
  }

  void ApplyRating(CarsProvider carData, int rating) async {
      carData.falseAll();

    currentUserRating = rating;
    db.createRecord(carData.currentCarManufacturer.data,
        carData.myModel.data,
        carData.myYear.data,
        currentUserRating);
    var presence = await db.Ispresent;
    if(presence==true){
      carData.communityRating = db.currentRating.toStringAsFixed(2);
    } else{
      carData.communityRating = await db.currentRating.toStringAsFixed(2);
    }

  }
}



