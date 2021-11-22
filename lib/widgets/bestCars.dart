import 'package:flutter/cupertino.dart';

class BestCars{
  BestCars({required this.Man, required this.Model, required this.year, required this.Rate});
  final String Man;
  final String Model;
  final String year;
  final dynamic Rate;

// Widget build(BuildContext context){
//   return Row(
//     children:<Widget>[
//       Text(Man),
//       Text(Model),
//       Text(year),
//       Text(Rate.toStringAsFixed(2))
//
//     ]
//   );
// }

  factory BestCars.fromJson(Map<String, dynamic> json) {
    return BestCars(
      Man: json['Manufacturer'],
      Model: json['Model'],
      year: json['Year'],
      Rate: json['Rating_all'],
    );
  }

}