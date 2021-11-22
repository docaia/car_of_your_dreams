import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
class StarButton extends StatelessWidget {
  StarButton({required this.starColor, this.starSize=60, required this.starLabel});
  final Color starColor;
  final double starSize;
  final String starLabel;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(Icons.star, semanticLabel: "1", color: starColor, size: starSize, ),
        Text(starLabel, style: kButtonStyle),
      ],
    );
  }
}