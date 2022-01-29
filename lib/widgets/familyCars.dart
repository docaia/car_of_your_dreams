import 'package:flutter/cupertino.dart';

class FamilyCars{
  FamilyCars({required this.Man, required this.Model, required this.year, required this.Rate});
  final String Man;
  final String Model;
  final String year;
  final dynamic Rate;


  factory FamilyCars.fromJson(Map<String, dynamic> json) {
    return FamilyCars(
      Man: json['Manufacturer'],
      Model: json['Model'],
      year: json['Year'],
      Rate: json['Rating_all'],
    );
  }

}