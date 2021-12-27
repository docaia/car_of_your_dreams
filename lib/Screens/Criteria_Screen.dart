import 'dart:convert';
import 'dart:html';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';


class CriteriaScreen extends StatelessWidget {
  @override
  //final fb = FirebaseFirestore.instance;
  //Db db = Db();

  //QuerySnapshot? ggSnap;

  
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed:(){

      Navigator.pushNamed(context, '1');
      },
          style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.amber) ),
    child: Text("Back to Home")),
                  ],
                ),
              ),
          Text('What do you wish?', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),),
              Card(
                shadowColor: Colors.black26,
                color: Colors.yellowAccent,
                elevation: 100,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
              minLeadingWidth: 25,
              onTap: () async{
          List bestCars = await MySQL().selectBestCars();
Provider.of<CarsProvider>(context, listen: false).bestCarsList = await MySQL().selectBestCars();
          print(bestCars[0].Man);


   await Provider.of<CarsProvider>(context, listen:false).getBest(bestCars, context);

//print(dd);
              },

              leading: CircleAvatar(child: Icon(Icons.car_rental_rounded)),
                  title: Text('Choose the best cars overall'),
          ),
              ),
    Flexible(

    child: FutureBuilder(

    builder: (context, projectSnap) {
    if (projectSnap.connectionState == ConnectionState.none &&
    projectSnap.hasData == null) {
    //print('project snapshot data is: ${projectSnap.data}');
    return Container();
    }
    return Visibility(
      visible: Provider.of<CarsProvider>(context, listen: true).criteriaVisibility,
      child: ListView.builder(

      padding: const EdgeInsets.all(8),

      itemCount: 5,

      itemBuilder: (BuildContext context, int index) {
        return Container(

            height: 50,


            child: RichText(
                text: TextSpan(
                    text: ' ${Provider
                        .of<CarsProvider>(context, listen: true)
                        .bestCarsList[index].Man}',
                    style: GoogleFonts.eastSeaDokdo(textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                    children: <TextSpan>[
                      TextSpan(text: '  ${Provider
                          .of<CarsProvider>(context, listen: false)
                          .bestCarsList[index].Model}',
                        style: GoogleFonts.ubuntu(textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400)),),
                      TextSpan(text: '  ${Provider
                          .of<CarsProvider>(context, listen: false)
                          .bestCarsList[index].year}',
                        style: GoogleFonts.ubuntu(textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400)),),
                      TextSpan(text: ' Rating:${Provider
                          .of<CarsProvider>(context, listen: false)
                          .bestCarsList[index].Rate}',
                        style: GoogleFonts.ubuntu(textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w400)),)
                    ]
                )
            )
        );
      },
      ),
    );

    },
    ),
    ),
              Card(
                shadowColor: Colors.black26,
                color: Colors.lightGreenAccent,
                elevation: 100,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  minLeadingWidth: 25,
                  onTap: () async{
                    List bestAgencies = await MySQL().selectBestAgencies();
                    Provider.of<CarsProvider>(context, listen: false).bestAgenciesList = await MySQL().selectBestAgencies();
                    print(bestAgencies[0].Man);


                    await Provider.of<CarsProvider>(context, listen:false).getBestAg(bestAgencies, context);

//print(dd);
                  },

                  leading: CircleAvatar(child: Icon(Icons.apartment_outlined)),
                  title: Text('Choose the best car agencies'),
                ),
              ),
              Flexible(

                child: FutureBuilder(

                  builder: (context, projectSnap) {
                    if (projectSnap.connectionState == ConnectionState.none &&
                        projectSnap.hasData == null) {
                      //print('project snapshot data is: ${projectSnap.data}');
                      return Container();
                    }
                    return Visibility(
                      visible: Provider.of<CarsProvider>(context, listen: true).criteriaVisibilityAgencies,
                      child: ListView.builder(

                        padding: const EdgeInsets.all(8),

                        itemCount: 5,

                        itemBuilder: (BuildContext context, int index) {
                          return Container(

                              height: 50,


                              child: RichText(
                                  text: TextSpan(
                                      text: ' ${Provider
                                          .of<CarsProvider>(context, listen: true)
                                          .bestAgenciesList[index].Man}',
                                      style: GoogleFonts.eastSeaDokdo(textStyle: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                      children: <TextSpan>[
                                        TextSpan(text: '  ${Provider
                                            .of<CarsProvider>(context, listen: false)
                                            .bestAgenciesList[index].Agency}',
                                          style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400)),),

                                        TextSpan(text: ' Rating:${Provider
                                            .of<CarsProvider>(context, listen: false)
                                            .bestAgenciesList[index].Rate}',
                                          style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.w400)),)
                                      ]
                                  )
                              )
                          );
                        },
                      ),
                    );

                  },
                ),
              ),
              //
                          ],
         )
      ),
    );

  }


}
