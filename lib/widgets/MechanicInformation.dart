import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';

class MechanicInformation extends StatelessWidget{
final Function infoType;
final String description;
final String text;
MechanicInformation(this.infoType,this.description,this.text);

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Text(text),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: TextField(
            decoration: kMessageTextFieldDecorationForm(description),

            onChanged: (value) {
              infoType(value);

            },

          ),
        ),
      ),
    ],
  );

  }
}
class TextFromUser{
  String attribute;
  Function varManipulate;
  TextFromUser(this.attribute, this.varManipulate);



}


