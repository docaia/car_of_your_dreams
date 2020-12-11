import 'package:flutter/cupertino.dart';

class BestCars{
  BestCars(this.Man, this.Model, this.year, this.Rate);
  final String Man;
  final String Model;
  final String year;
  final dynamic Rate;

Widget build(BuildContext context){
  return Row(

    children:<Widget>[
      Text(Man),
      Text(Model),
      Text(year),
      Text(Rate.toStringAsFixed(2))

    ]
  );
}

}