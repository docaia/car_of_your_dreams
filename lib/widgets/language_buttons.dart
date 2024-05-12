import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageButtons extends StatelessWidget{
  LanguageButtons(this.text, this.l1, this.l2);
  String text;
  String l1;
  String l2;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(onPressed: (){
      Get.updateLocale(Locale(l1, l2));
    }, child: Text(text));
  }

}