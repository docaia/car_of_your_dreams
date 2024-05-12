import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButtons{
  MainButtons({required this.desc, required this.path});
  Icon desc;
  String path;

  Widget build(BuildContext context){
    return ElevatedButton(onPressed: (){Navigator.pushNamed(context, path);},
        child: desc );
  }


}