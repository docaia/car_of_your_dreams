import 'package:cloud_firestore/cloud_firestore.dart';

class Db{

  final dbf = FirebaseFirestore.instance;
  dynamic currentRating;
  bool Ispresent;

  void createRecord(String Make, String model, String year, int rate) async {
    bool docExists;
    try{
      var doc = await dbf.collection("car").doc("${Make}_${year}_$model").get();
      docExists = doc.exists;
      print("Document exists in Firestore? " + docExists.toString());
    } catch(e){
      throw e;
    }
if(docExists==false){
  Ispresent = false;
    await dbf.collection("car").doc("${Make}_${year}_$model").set({
      'title': Make,
      'Model': model,
      'Year': year
    });
    await dbf.collection("car").doc("${Make}_${year}_$model").update({
          'Rating_Overall': rate

    });

  }
else{
  Ispresent = true;
  var previousRate= await dbf.collection("car").doc("${Make}_${year}_$model").get();
   currentRating = previousRate['Rating_Overall'];
  final UpdatedRate = ((currentRating*99) + rate)/100;  //Take current rating, average with last 100 ratings..
  await dbf.collection("car").doc("${Make}_${year}_$model").update({
    'Rating_Overall': UpdatedRate
  });
    }
  }
//query best:
  void queryRecord() async {

    QuerySnapshot x= await dbf.collection("car").where('Rating_overall', isGreaterThan: 4.5).get();
    x.docs.forEach(
            (res) {
          print(res.data());
        }

    );

  }

}