//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import '../widgets/UserInputScreen.dart';

//DocumentSnapshot? _cI;
//DocumentSnapshot? get cI => _cI;    // To ensure readonly

Future<Null> setCI() async {
  // set your _token here
}

class Db {
@override
  //final dbf = FirebaseFirestore.instance;
  dynamic currentRating;
  late bool Ispresent;
  //late DocumentSnapshot carInfo;

  void createRecord(String Make, String model, String year, int rate) async {
    bool docExists;
    try {
    //  var doc = await dbf.collection("car").doc("${Make}_${year}_$model").get();
      //docExists = doc.exists;
     // print("Document exists in Firestore? " + docExists.toString());
    } catch (e) {
      throw e;
    }
    //if (docExists == false) {
      Ispresent = false;
     // await dbf.collection("car").doc("${Make}_${year}_$model").set({
       // 'title': Make,
        //'Model': model,
        //'Year': year,

        //bad things
        //'Noisy':0,
        //'Brakes are weak':0,
        // 'Heat issues':0,
        // 'Not stable at high speeds':0,
        // 'Too slow acceleration':0,
        // 'Too close to ground':0,
        // 'Tight seating':0,

        //good things
  //       'dependable, No unexpected problems':0,
  //       'Stable at high speeds':0,
  //       'Good acceleration':0,
  //       'Big storage space':0,
  //       'Comfortable and large seats':0,
  //     });
  //     await dbf.collection("car").doc("${Make}_${year}_$model").update({
  //       'Rating_Overall': rate
  //     });
  //   }
  //   else {
  //     Ispresent = true;
  //
  //     _cI = await dbf.collection("car").doc("${Make}_${year}_$model").get();
  //     currentRating = await _cI!['Rating_Overall'];
  //     final UpdatedRate = ((currentRating * 99) + rate) /
  //         100; //Take current rating, average with last 100 ratings..
  //     await dbf.collection("car").doc("${Make}_${year}_$model").update({
  //       'Rating_Overall': UpdatedRate
  //
  //     });
  //   }
  // }

//query best:
 // void queryRecord() async {
//    QuerySnapshot x = await dbf.collection("car").where(
  //      'Rating_overall', isGreaterThan: 4.5).get();
  //   x.docs.forEach(
  //           (res) {
  //         print(res.data());
  //       }

//    );
  //}
//add 1 to the chosen problem by user
//   void chosenProblem(context) async {
//     try {
//       var selected = Provider.of<CarsProvider>(context, listen: false).selectedIssueBad;
// var prevValue = _cI![Provider.of<CarsProvider>(context, listen: false).selectedIssueBad]+1;
//       await dbf.collection("car").doc("${Provider
//           .of<CarsProvider>(context, listen: false)
//           .currentCarManufacturer
//           .data}_${Provider
//           .of<CarsProvider>(context, listen: false)
//           .myYear
//           .data}_${Provider
//           .of<CarsProvider>(context, listen: false)
//           .myModel
//           .data}").update({
//         selected: prevValue,


  //     },
  //
  //     );
  //     // var jeff = _cI['Heat issues'];
  //     //  print(jeff);
  //   } catch (e) {
  //     throw e;
  //   }
  // }


}}