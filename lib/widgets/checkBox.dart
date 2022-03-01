import 'package:flutter/material.dart';
class CheckBox extends StatefulWidget {

  Widget check;
  CheckBox(this.check);
  @override
  _CheckBoxState createState() => _CheckBoxState();

}

class _CheckBoxState extends State<CheckBox> {


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return widget.check;
  }
}
