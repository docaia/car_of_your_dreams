import 'dart:async';

import 'package:car_of_your_dreams/Screens/FocusedMechanicScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/Constants.dart';


class ResultsMech extends StatefulWidget {
  @override


  @override
  State<ResultsMech> createState() => _ResultsMechState();
}

class _ResultsMechState extends State<ResultsMech> {
  final ScrollController ctrl= ScrollController(debugLabel: 'horiz');
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(backgroundColor: Colors.blue[400],
        body: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(color: Colors.blue[400]),//[400]),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, top: 8),
                        child: Stack(
                          children: [
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.2,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.1,
                                child: Image.asset('Images/CarKenz4.gif')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // ElevatedButton(onPressed: () {
                                //   Navigator.pushNamed(context, '1');
                                // },
                                //     style: ButtonStyle(
                                //         backgroundColor: MaterialStateProperty
                                //             .all<Color>(
                                //             Colors.lightBlueAccent)),
                                //     child: Text(" شوف إحصائيات أكثر (تجريبي)")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Text('شكرا!ً. قائمة الأفضل', style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          backgroundColor: Colors.blue[400],
                          color: Colors.black,
                          fontSize: 25,
                          decoration: TextDecoration.none

                      ),),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Scrollbar(
                          controller: ctrl,
                          child: SingleChildScrollView(
                            controller: ctrl,
                            scrollDirection: Axis.horizontal,
                            child: DataTable(

                              border: TableBorder.all(color: Colors.transparent),
                              columns: [
                                DataColumn(label:
                                  Text('الإسم', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.blue[900]),),
                                ),
                                    DataColumn(label:
                                    Text('التقييم', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.blue[900]),),),
                                DataColumn(label:
                                Text('التليفون', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.blue[900]),),),
                                DataColumn(label:
                                Text('الورشه', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.blue[900]),),),

                              ], rows: [
                              DataRow(cells: [
                                DataCell(PopUpInfo(0)),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].rate, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].phone, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].ws, overflow: TextOverflow.fade, style: kTabla),),
                            ],),
                              DataRow(cells: [
                                DataCell(PopUpInfo(1)),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].rate, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].phone, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].ws, overflow: TextOverflow.fade, style: kTabla),),
                              ], ),
                              DataRow(cells: [
                                DataCell(PopUpInfo(2)),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].rate, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].phone, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].ws, overflow: TextOverflow.fade, style: kTabla),),
                              ],),
                              DataRow(cells: [
                                DataCell(PopUpInfo(3)),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].rate, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].phone, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].ws, overflow: TextOverflow.fade, style: kTabla),),
                              ],),
                              DataRow(cells: [
                                DataCell(PopUpInfo(4)),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].rate, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].phone, style: kTabla),),
                                DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].ws, overflow: TextOverflow.fade, style: kTabla),),
                              ],),

                      ],
                    ),
                          ),
                        ),



                  ],
                ),
                    Container(

                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8),
                            child: TextButton(onPressed: () {
                              Navigator.pushNamed(context, '8');
                            },
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide())),
                                child: Text("تقييم جديد", style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20)),)),
                          ),


                        ],
                      ),
                    ),

                  ],
              ),
              ),
              Visibility(
                visible: MediaQuery.of(context).size.width>400? true: false,
                child: Expanded(
                  flex: 1,
                  child: RiveAnimation.asset('mechanic1.riv'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class PopUpInfo extends StatelessWidget {
  PopUpInfo( this.rowNum ) ;
  final int rowNum;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () { showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue[100],
          alignment: Alignment.topLeft,

          title: Text(Provider.of<CarsProvider>(context, listen:false).topMechs[rowNum].mech),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Specialty: ${Provider.of<CarsProvider>(context, listen:false).topMechs[rowNum].specialty}'),

                TextButton( onPressed: () { launchUrl(Uri.parse('https://maps.google.com/?q=${Provider.of<CarsProvider>(context, listen:false).topMechs[rowNum].lat},${Provider.of<CarsProvider>(context, listen:false).topMechs[rowNum].long}')); },
                child: Text('Location: see location on maps')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    ); }, //Navigator.push(context,MaterialPageRoute (
                            //builder: (BuildContext context) => FocusedMechanicScreen(name: Provider.of<CarsProvider>(context, listen:false).topMechs[0].mech),), );
    child: Text(Provider.of<CarsProvider>(context, listen:false).topMechs[rowNum].mech, style: kTabla,));
  }
}
