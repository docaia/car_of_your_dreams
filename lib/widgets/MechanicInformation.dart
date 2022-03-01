import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:flutter/services.dart';

class MechanicInformation extends StatelessWidget{
final Function infoType;
final String description;
final String text;
TextInputType keyBoardType = TextInputType.text;
List<TextInputFormatter> formato;
MechanicInformation(this.infoType,this.description,this.text, this.keyBoardType, this.formato);

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Flexible(
        flex:1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
          child: Text(text, style: TextStyle(fontWeight: FontWeight.w900),),
        ),
      ),
      Flexible(
        flex:2,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: TextField(
            decoration: kMessageTextFieldDecorationForm(description),
            keyboardType: keyBoardType,
  inputFormatters: formato,
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


