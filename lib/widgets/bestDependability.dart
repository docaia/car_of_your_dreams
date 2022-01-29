import 'package:flutter/cupertino.dart';

class BestDepend{
  BestDepend({required this.Man, required this.Model, required this.year, required this.Rate});
  final String Man;
  final String Model;
  final String year;
  final dynamic Rate;


  factory BestDepend.fromJson(Map<String, dynamic> json) {
    return BestDepend(
      Man: json['Manufacturer'],
      Model: json['Model'],
      year: json['Year'],
      Rate: json['Rating_Dep'],
    );
  }

}