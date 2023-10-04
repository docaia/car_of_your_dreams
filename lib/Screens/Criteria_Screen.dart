import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/widgets/OnHoverButton.dart';


class CriteriaScreen extends StatelessWidget {
  @override
  //final fb = FirebaseFirestore.instance;
  //Db db = Db();

  //QuerySnapshot? ggSnap;

  
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body:  RawScrollbar(
          isAlwaysShown: true,
          radius: Radius.circular(60),
          thickness: 15,
          thumbColor: Colors.white,
          child: ListView(
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
            Align(
              alignment: Alignment.center,
              child: Text('What do you want in a car?', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),),
            ),
                SizedBox(
                  height: 20,
                ),
                //each widget below will contain a question mark button, another button for fetching its list of cars and an icon all stacked
                Stack(
                  alignment: Alignment.center,
                  children: [

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1 ,
                        width: MediaQuery.of(context).size.width * 0.5 ,
                        child: Stack(
clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5 ,
                              child: ElevatedButton(onPressed: () async{
                      List bestDepies = await MySQL().selectBestDependables();
                      Provider.of<CarsProvider>(context,listen: false).bestDepList = await MySQL().selectBestDependables();
                      Provider.of<CarsProvider>(context,listen: false).getBestdep(context);
                      },
                                  style: ElevatedButton.styleFrom(
                                     side:BorderSide(),
                                    fixedSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1 ),
                                  )
                                  ,
                                  child: Text('Dependability')),
                            ),
                            HoverButton(visibility:Provider.of<CarsProvider>(context,listen: false).visibilityChanger,
                            SQLFetch: MySQL().selectBestDependables,
                                fetchedList: Provider.of<CarsProvider>(context,listen: false).bestDepList,
                              getBestType: Provider.of<CarsProvider>(context,listen: false).getBestdep,),
                            Positioned
                              (bottom: 5,top:45,
                                child: Icon(Icons.car_repair, size:30, color: Colors.blueGrey))
                          ]
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 45, left: 550),
                        child: Visibility(
                            visible: Provider.of<CarsProvider>(context, listen: true).questionMarkVisibility,
                            child: Text('Cars with long live for spare parts, no problems, just start and drive!')),
                      ),
                    ),

                  ],
                ),
                Visibility(
                  visible: Provider.of<CarsProvider>(context, listen: true).depVisibility,
                  child: SizedBox(
                    height: 250,
                    child: FutureBuilder(

                      builder: (context, projectSnap) {
                        if (projectSnap.connectionState == ConnectionState.none &&
                            projectSnap.hasData == null) {
                          //print('project snapshot data is: ${projectSnap.data}');
                          return Container();
                        }
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: 5,

                          itemBuilder: (BuildContext context, int index) {
                            return Container(

                                height: 50,


                                child: RichText(
                                    text: TextSpan(
                                        text: ' ${Provider
                                            .of<CarsProvider>(context, listen: true)
                                            .bestDepList[index].Man}',
                                        style: GoogleFonts.alef(textStyle: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                        children: <TextSpan>[
                                          TextSpan(text: '  ${Provider
                                              .of<CarsProvider>(context, listen: false)
                                              .bestDepList[index].Model}',
                                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w400)),),
                                          TextSpan(text: '  ${Provider
                                              .of<CarsProvider>(context, listen: false)
                                              .bestDepList[index].year}',
                                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                                fontSize: 25,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w400)),),
                                          TextSpan(text: ' Rating:${Provider
                                              .of<CarsProvider>(context, listen: false)
                                              .bestDepList[index].Rate}',
                                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w400)),)
                                        ]
                                    )
                                )
                            );
                          },
                        );

                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1 ,
                        width: MediaQuery.of(context).size.width * 0.5 ,
                        child: Stack(
                            clipBehavior: Clip.hardEdge,
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(onPressed: () async{

                                  Provider.of<CarsProvider>(context,listen: false).bestFamList = await MySQL().getFamilyCars();
                                  Provider.of<CarsProvider>(context,listen: false).getBestfam(context);
                                },
                                    style: ElevatedButton.styleFrom(
                                      side:BorderSide(),
                                      fixedSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1 ),
                                    )
                                    ,
                                    child: Text('Family')),
                              ),
                              HoverButton(visibility:Provider.of<CarsProvider>(context,listen: false).visibilityFamilyChanger,
                                  SQLFetch: MySQL().getFamilyCars,
                                  fetchedList: Provider.of<CarsProvider>(context,listen: false).bestFamList,
                              getBestType: Provider.of<CarsProvider>(context,listen: false).getBestfam,),
                              Positioned
                                (bottom: 5,top:45,
                                  child: Icon(Icons.family_restroom_outlined, size:30, color: Colors.blueGrey))
                            ]
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 45, left: 550),
                        child: Visibility(
                            visible: Provider.of<CarsProvider>(context, listen: true).questionFamilyVisibility,
                            child: Text('Best for family, big storage space, comfortable and durable cars')),
                      ),
                    ),

                  ],
                ),
                Visibility(
                  visible: Provider.of<CarsProvider>(context, listen: true).famVisibility,
                  child: SizedBox(
                    height: 250,
                    child: FutureBuilder(

                      builder: (context, projectSnap) {
                        if (projectSnap.connectionState == ConnectionState.none &&
                            projectSnap.hasData == null) {
                          //print('project snapshot data is: ${projectSnap.data}');
                          return Container();
                        }
                        return ListView.builder(
                          primary: false,
                          padding: const EdgeInsets.all(8),
                          itemCount: 5,

                          itemBuilder: (BuildContext context, int index) {
                            return Container(

                                height: 50,


                                child: RichText(
                                    text: TextSpan(
                                        text: ' ${Provider
                                            .of<CarsProvider>(context, listen: true)
                                            .bestFamList[index].Man}',
                                        style: GoogleFonts.eastSeaDokdo(textStyle: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                        children: <TextSpan>[
                                          TextSpan(text: '  ${Provider
                                              .of<CarsProvider>(context, listen: false)
                                              .bestFamList[index].Model}',
                                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w400)),),
                                          TextSpan(text: '  ${Provider
                                              .of<CarsProvider>(context, listen: false)
                                              .bestFamList[index].year}',
                                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                                fontSize: 25,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.w400)),),
                                          TextSpan(text: ' Rating:${Provider
                                              .of<CarsProvider>(context, listen: false)
                                              .bestFamList[index].Rate}',
                                            style: GoogleFonts.ubuntu(textStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w400)),)
                                        ]
                                    )
                                )
                            );
                          },
                        );

                      },
                    ),
                  ),
                ),
//                 Card(
//                   shadowColor: Colors.black26,
//                   color: Colors.yellowAccent,
//                   elevation: 100,
//                   clipBehavior: Clip.hardEdge,
//                   child: ListTile(
//                 minLeadingWidth: 25,
//                 onTap: () async{
//             List bestCars = await MySQL().selectBestCars();
// Provider.of<CarsProvider>(context, listen: false).bestCarsList = await MySQL().selectBestCars();
//             print(bestCars[0].Man);
//
//
//    await Provider.of<CarsProvider>(context, listen:false).getBest(bestCars, context);
//
// //print(dd);
//                 },
//
//                 leading: CircleAvatar(child: Icon(Icons.car_rental_rounded)),
//                     title: Text('Choose the best cars overall'),
//             ),
//                 ),
                SizedBox(
                  height: 20,
                ),
                Align(
     alignment: Alignment.center,
     child: Container(
       height: MediaQuery.of(context).size.height * 0.1 ,
       width: MediaQuery.of(context).size.width * 0.5 ,
       child: ElevatedButton(onPressed: () async{
         List bestCars = await MySQL().selectBestCars();
         Provider.of<CarsProvider>(context, listen: false).bestCarsList = await MySQL().selectBestCars();
         print(bestCars[0].Man);


         await Provider.of<CarsProvider>(context, listen:false).getBest(bestCars, context);

       },
         style: ElevatedButton.styleFrom(
           side:BorderSide(),
           fixedSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1 ),
         )
         ,

         child: Text('Best overall')),
     ),
   ),
    Visibility(
      visible: Provider.of<CarsProvider>(context, listen: true).criteriaVisibility,
      child: SizedBox(
          height: 250,
          child: FutureBuilder(

          builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
          }
          return ListView.builder(
            primary: false,
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
                    style: kCriteriaListStyle,
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
          );

          },
          ),
      ),
    ),
//                 Card(
//                   shadowColor: Colors.black26,
//                   color: Colors.lightGreenAccent,
//                   elevation: 100,
//                   clipBehavior: Clip.hardEdge,
//                   child: ListTile(
//                     minLeadingWidth: 25,
//                     onTap: () async{
//                       List bestAgencies = await MySQL().selectBestAgencies();
//                       Provider.of<CarsProvider>(context, listen: false).bestAgenciesList = await MySQL().selectBestAgencies();
//                       print(bestAgencies[0].Man);
//
//
//                       await Provider.of<CarsProvider>(context, listen:false).getBestAg(bestAgencies, context);
//
// //print(dd);
//                     },
//
//                     leading: CircleAvatar(child: Icon(Icons.apartment_outlined)),
//                     title: Text('Choose the best car agencies'),
//                   ),
//                 ),
              SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1 ,
                    width: MediaQuery.of(context).size.width * 0.5 ,
                    child: ElevatedButton(onPressed: () async{
                      List bestAgencies = await MySQL().selectBestAgencies();
                      Provider.of<CarsProvider>(context, listen: false).bestAgenciesList = await MySQL().selectBestAgencies();
                      print(bestAgencies[0].Man);


                      await Provider.of<CarsProvider>(context, listen:false).getBestAg(bestAgencies, context);

//print(dd);
                    },
                        style: ElevatedButton.styleFrom(
                          side:BorderSide(),
                          fixedSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1 ),
                        )
                        ,

                        child: Text('Best Agencies')),
                  ),
                ),
                Visibility(
                  visible: Provider.of<CarsProvider>(context, listen: true).criteriaVisibilityAgencies,
                  child: SizedBox(
                    height: 250,
                    child: FutureBuilder(

                      builder: (context, projectSnap) {
                        if (projectSnap.connectionState == ConnectionState.none &&
                            projectSnap.hasData == null) {
                          //print('project snapshot data is: ${projectSnap.data}');
                          return Container();
                        }
                        return ListView.builder(
                          primary: false,
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
                                        style: GoogleFonts.alef(textStyle: TextStyle(
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
                        );

                      },
                    ),
                  ),
                ),
                //
                            ],
               ),
        ),
        ),
      );


  }


}



