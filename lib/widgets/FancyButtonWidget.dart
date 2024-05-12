import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/change_notifier.dart';
import '../Services/mySQL_setup.dart';

class FancyButtonWidget extends StatelessWidget {
  const FancyButtonWidget({required this.route, required this.label, required this.imagen});
  final String route;
  final String label;
  final String imagen;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,

      child: ElevatedButton(onPressed: ()async {
        Provider.of<CarsProvider>(context,listen: false).topMechs= await MySQL().getTopMechanics();
        Navigator.pushNamed(context, route);

      },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shadowColor: MaterialStateProperty.all<Color>(Colors.white70),
              elevation: MaterialStateProperty.all<double>(100),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)))),

          child: Ink(
            decoration: const BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.white, Colors.black]),
              borderRadius: BorderRadius.all(Radius.circular(90.0)),),
            child: Stack(

              children: [
                Align(alignment: Alignment(0.8,0.5),
                    child: Text(label, style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06),)),

                Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Image.asset(imagen)),


              ],
            ),
          )),
    );

  }
}