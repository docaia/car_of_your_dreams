import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:provider/provider.dart';
class HoverButton extends StatelessWidget {
  HoverButton({
    required this.visibility, required this.SQLFetch, required this.fetchedList, required this.getBestType
  }) ;
  Function visibility;
  Function SQLFetch;
  List fetchedList;
  Function getBestType;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right:5, left:95, top:5, bottom:50,
      child: MouseRegion(
        onEnter: (e)=>visibility(true),
        onExit: (e)=>visibility(false),
        child: OutlinedButton(onPressed: () async{
          fetchedList = await SQLFetch();
          getBestType(context);
        },
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black)),
                shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder())
            ),

            child: Text('?', style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}