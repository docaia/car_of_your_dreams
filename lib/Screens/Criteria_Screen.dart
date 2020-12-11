import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:car_of_your_dreams/widgets/bestCars.dart';


class CriteriaScreen extends StatelessWidget {
  @override
  final fb = FirebaseFirestore.instance;
  Db db = Db();

  QuerySnapshot ggSnap;

  
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FlatButton(onPressed: ()async{
                  db.queryRecord();
                  ggSnap= await fb.collection('car').orderBy('Rating_Overall',descending: true).limit(5).get();    //where('Rating_2020.Tawkeel_R', isEqualTo: 5)
      Provider.of<CarsProvider>(context, listen: false).getBest(ggSnap, context);
                },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('Highest rated cars', style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 25)),


                    ],
                  ),),
              ),
              Flexible(

                  child: FutureBuilder(

                      builder: (context, projectSnap) {
                        if (projectSnap.connectionState == ConnectionState.none &&
                            projectSnap.hasData == null) {
                          //print('project snapshot data is: ${projectSnap.data}');
                          return Container();
                        }
                        return ListView.builder(

                            padding: const EdgeInsets.all(8),

                            itemCount: 5,

                            itemBuilder: (BuildContext context, int index) {
                              return Container(

                                  height: 50,


                                  child: RichText(
                                      text: TextSpan(
                                          text: ' ${Provider
                                              .of<CarsProvider>(context, listen: true)
                                              .bestCarsList[index].Man}', style:GoogleFonts.eastSeaDokdo(textStyle:TextStyle(fontSize: 40, color: Colors.white, fontWeight:FontWeight.w500 )  ),
                                          children: <TextSpan>[
                                            TextSpan(text:'  ${Provider
                                                .of<CarsProvider>(context, listen: false)
                                                .bestCarsList[index].Model}', style:GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 25, color: Colors.white70, fontWeight:FontWeight.w400 )  ), ),
                                            TextSpan(text:'  ${Provider
                                                .of<CarsProvider>(context, listen: false)
                                                .bestCarsList[index].year}', style:GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 25, color: Colors.blueGrey, fontWeight:FontWeight.w400 )  ), ),
                                            TextSpan(text:' Rating:${Provider
                                                .of<CarsProvider>(context, listen: false)
                                                .bestCarsList[index].Rate}', style:GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight:FontWeight.w400 )  ), )
                                          ]
                                      )
                                  )
                              );


                             }

                        );
                      }
                  )

              ),
            ],
          )
      ),
    );
  }


}
