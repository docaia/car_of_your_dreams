import 'package:car_of_your_dreams/widgets/StarRating_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/widgets/StarRating_toggle.dart';

class CarsProvider extends ChangeNotifier{
  //put here the main variables and the car list
  Text currentCarManufacturer = Text('Toyota');
  bool star1IsChecked = false;
  bool star2IsChecked = false;
  bool star3IsChecked = false;
  bool star4IsChecked = false;
  bool star5IsChecked = false;
  List<Text> manufacturers=[
    Text('Toyota', style: kStyle,),
    Text('VolksWagen', style: kStyle,),
    Text( 'Nissan', style: kStyle,),
    Text('Renault', style: kStyle,)
  ];
  List<Text> volksWagenModels=[
  Text('Golf', style: kStyle,),
    Text('Passat', style: kStyle,),
    Text('Polo', style: kStyle,),
    Text('Gol', style: kStyle,),
    Text('Jetta', style: kStyle,),
  ];
  List<Text> toyotaModels = [
    Text('Camry', style: kStyle,),
    Text('Corolla', style: kStyle,),
    Text( 'Yaris', style: kStyle,),
    Text('Runner', style: kStyle,)
  ];
  List<Text> year = [
    Text('2005', style: kStyle,),
    Text('2010', style: kStyle,),
    Text( '2015', style: kStyle,),
    Text('2020', style: kStyle,)
  ];
  List<Text> modelSelection(Text Manufacturer) {
    List<Text> theModel =[Text('7abeeby'), Text('7ayaty')];
    if(Manufacturer.data=="Toyota"){theModel = toyotaModels;}
    else if(Manufacturer.data=="VolksWagen"){theModel = volksWagenModels;}
    notifyListeners();
    print(theModel);
    return theModel;
     }
  StarRatingToggle myToggle = StarRatingToggle();
  void starStatusChange(bool isChecked1){
    myToggle.ratingToggle();
    isChecked1 = myToggle.isChecked;
     notifyListeners();
  }
  void falseAll(){
    star1IsChecked = false;
    star2IsChecked = false;
    star3IsChecked = false;
    star4IsChecked = false;
    star5IsChecked = false;
    myToggle.isChecked=false;
  }
}


