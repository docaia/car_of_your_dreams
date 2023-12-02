import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:rive/rive.dart';

import '../widgets/Constants.dart';


class ResultsMech extends StatefulWidget {
  @override


  @override
  State<ResultsMech> createState() => _ResultsMechState();
}

class _ResultsMechState extends State<ResultsMech> {

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
                                ElevatedButton(onPressed: () {
                                  Navigator.pushNamed(context, '1');
                                },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(
                                            Colors.lightBlueAccent)),
                                    child: Text(" شوف إحصائيات أكثر (تجريبي)")),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
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
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].mech, style: kTabla,)),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].rate, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].phone, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[0].ws, overflow: TextOverflow.fade, style: kTabla),),
                          ],),
                            DataRow(cells: [
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].mech, style: kTabla,)),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].rate, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].phone, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[1].ws, overflow: TextOverflow.fade, style: kTabla),),
                            ], ),
                            DataRow(cells: [
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].mech, style: kTabla,)),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].rate, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].phone, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[2].ws, overflow: TextOverflow.fade, style: kTabla),),
                            ],),
                            DataRow(cells: [
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].mech, style: kTabla,)),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].rate, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].phone, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[3].ws, overflow: TextOverflow.fade, style: kTabla),),
                            ],),
                            DataRow(cells: [
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].mech, style: kTabla,)),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].rate, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].phone, style: kTabla),),
                              DataCell(Text(Provider.of<CarsProvider>(context, listen:false).topMechs[4].ws, overflow: TextOverflow.fade, style: kTabla),),
                            ],),

                      ],
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
Navigator.pop(context);
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
              Expanded(
                flex: 1,
                child: RiveAnimation.asset('mechanic1.riv'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
