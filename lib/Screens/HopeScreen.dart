import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_of_your_dreams/widgets/Manufacturers.dart';
import 'package:car_of_your_dreams/widgets/CarModels.dart';
import 'package:car_of_your_dreams/Services/carModelsLists.dart';

class MassVotingScreen extends StatefulWidget {
  const MassVotingScreen({Key? key}) : super(key: key);

  @override
  State<MassVotingScreen> createState() => _MassVotingScreenState();
}

class _MassVotingScreenState extends State<MassVotingScreen> {
  final tawkeel = new GlobalKey();
  late List<Manufacturers> cars;
  CarModel? selectedModel;
  var dropdownValue;
  var dropdownModel;
  var dropdownYear;
  Manufacturers? selectedManu;
  List<CarModel>?modelsforManu = [];
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cars =[Manufacturers('Toyota', mToyota),Manufacturers('JEEP', mJEEP), Manufacturers('KIA', mKIA), Manufacturers('FIAT', mFIAT), Manufacturers('Honda', mHonda),Manufacturers('Hyundai', mHyundai), Manufacturers('Mercedes', mMercedes),Manufacturers('BMW', mBMW), Manufacturers('SEAT', mSEAT), Manufacturers('VolksWagen', mVolksWagen), Manufacturers('Peugeot', mPeugeot), Manufacturers('Nissan', mNissan), Manufacturers('Suzuki', mSuzuki),];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: RawScrollbar(
        thickness: 20,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(child: Text('أهلاً بكم في موقع مركز معلومات السيارات في مصر: كنز السيارات', style: GoogleFonts.almarai(textStyle:TextStyle(fontSize: 50, color: Colors.white, fontWeight:FontWeight.w500 )),)),
              ),
        Text('نقوم بجمع اّراء ملاك السيارات عن مزايا و عيوب و خفايا كل سياره، كما نحلل أداء المكانيكيين المتخصصين في الصيانه', style: GoogleFonts.almarai(textStyle:TextStyle(fontSize: 20, color: Colors.white, fontWeight:FontWeight.w200 )),),
            SizedBox(height: 100,),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors?.blue[700]!)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:2,
                      child:SizedBox()
                    ),
                    Expanded(
                      flex:2,
                      child: Card(
                      color: Colors.blueGrey[900],
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          Text('قم باختيار السياره', style: GoogleFonts.almarai(textStyle:TextStyle(fontSize: 28, color: Colors.white, fontWeight:FontWeight.w200 )),),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DropdownButton<String>(
                                    value: dropdownYear,
                                    hint:Text('سنة الصنع', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                                    icon: Icon(Icons.timer),
                                    style:TextStyle(color: Colors.white) ,
                                    dropdownColor: Colors.blueGrey[900],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownYear = newValue;
                                        isVisible = false;
                                        Scrollable.ensureVisible(tawkeel.currentContext!);
                                      });
                                    },
                                    items: years.map((String item){
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Container(
                                            color: Colors.blueGrey[900],
                                            child: Text(item, style: TextStyle(fontWeight: FontWeight.w900),)),
                                      );
                                    }
                                    ).toList()
                                ),
                              ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DropdownButton<CarModel>(
                                  value: dropdownModel,
                                  hint:Text('الماركه', style: TextStyle(fontWeight: FontWeight.w700, color:Colors.white)),
                                  icon: Icon(Icons.bloodtype),
                                  style:TextStyle(color: Colors.white) ,
                                  dropdownColor: Colors.blueGrey[900],
                                  onChanged: (CarModel? newValue) {
                                    setState(() {
                                      dropdownModel = newValue;
                                      isVisible = false;
                                    });
                                  },
                                  items: modelsforManu?.map((CarModel item){
                                    return DropdownMenuItem<CarModel>(
                                      value: item,
                                      child: Container(
                                          color: Colors.blueGrey[900],
                                          child: Text(item.name)),
                                    );
                                  }
                                  ).toList()
                              ),
                            ),

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DropdownButton<Manufacturers>(
                                    value: dropdownValue,
                                    hint:Text('الصانع', style: TextStyle(fontWeight: FontWeight.w700, color:Colors.white)),
                                    icon: Icon(Icons.precision_manufacturing_outlined),
                                    style:TextStyle(color: Colors.white) ,
                                    dropdownColor: Colors.blueGrey[900],
                                    onChanged: (Manufacturers? newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                        selectedManu = dropdownValue;
                                        dropdownModel = null;
                                        modelsforManu= selectedManu?.models;
                                        isVisible = false;
                                      });
                                    },
                                    items: cars.map((Manufacturers item){
                                      return DropdownMenuItem<Manufacturers>(
                                        value: item,
                                        child: Container(
                                            color: Colors.blueGrey[900],
                                            child: Text(item.name)),
                                      );
                                    }
                                    ).toList()
                                ),
                              ),
                          ],),
                        ],
                      ),

            ),
                    ),
Expanded(
  flex:2,
  child:   Padding(
    padding: const EdgeInsets.fromLTRB(0,5,20,0),
    child:   Align(

      alignment: Alignment.topRight,

      child:   Container(



        color: Colors.blueGrey[900],



      height: 200,



        width: 200,



        child:   Padding(
          padding: const EdgeInsets.fromLTRB(0,0,10,0),
          child: ListView(

      primary: false,

      shrinkWrap: true,

                  physics: NeverScrollableScrollPhysics(),

                  children:<Widget>[

          Align(alignment: Alignment.topRight, child: Text('اختر', style: TextStyle(color: Colors.green, fontSize: 21),)),
                    Align(alignment: Alignment.topRight,child: Text(' تقييم التوكيل', style: TextStyle(color: Colors.white70),)),
                    Align(alignment: Alignment.topRight,child: Text('تقييم الإعتماديه', style: TextStyle(color: Colors.white70),)),
                 Align(alignment: Alignment.topRight,child: Text('الأفضل', style: TextStyle(color: Colors.white70),)),

                    Align(alignment: Alignment.topRight,child: Text('الأسوأ', style: TextStyle(color: Colors.white70),)),

                    Align(alignment: Alignment.topRight,child: Text('ميكانيكي', style: TextStyle(color: Colors.white70),)),















                  ]















                ),
        ),



      ),

    ),
  ),
)
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/2,),
              Container(
                decoration: BoxDecoration(border: Border.all(
                  color: Colors.blue[700]!
                )),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Expanded(
                          child:SizedBox()
                      ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      key: tawkeel,
                      children: [
                        Image.asset('Images/carWS.jpg', fit:BoxFit.cover,),
                          Positioned.fill(
                            child: ClipRect(
                              child: BackdropFilter(
                                filter:ImageFilter.blur(sigmaX:10, sigmaY:10),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.stretch,
                                  children: [
                                    Text('ما مدي رضاك عن التوكيل المعتمد؟', style: GoogleFonts.almarai(textStyle:TextStyle(fontSize: 50, color: Colors.white, fontWeight:FontWeight.w500 )),),
                                SizedBox(height: 300,),
                                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     ElevatedButton(onPressed: (){}, child: Text('زباله', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2)),
                                     ),),
                                     ElevatedButton(onPressed: (){}, child: Text('ممكن يكون أفضل', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2)) )),
                                     ElevatedButton(onPressed: (){}, child: Text('جيد', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)), style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2)))),
                                     ElevatedButton(onPressed: (){}, child: Text('ممتاز', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2)))),
                                   ],
                                 )
                                  ],
                                ),
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                      Expanded(
                        flex:2,
                        child:   Padding(
                          padding: const EdgeInsets.fromLTRB(0,5,20,0),
                          child:   Align(

                            alignment: Alignment.topRight,

                            child:   Container(



                              color: Colors.blueGrey[900],



                              height: 200,



                              width: 200,



                              child:   Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                child: ListView(

                                    primary: false,

                                    shrinkWrap: true,

                                    physics: NeverScrollableScrollPhysics(),

                                    children:<Widget>[

                                      Align(alignment: Alignment.topRight, child: Text('اختر', style: TextStyle(color: Colors.white70),)),
                                      Align(alignment: Alignment.topRight,child: Text(' تقييم التوكيل', style: TextStyle(color: Colors.green, fontSize: 21),)),
                                      Align(alignment: Alignment.topRight,child: Text('تقييم الإعتماديه', style: TextStyle(color: Colors.white70),)),
                                      Align(alignment: Alignment.topRight,child: Text('الأفضل', style: TextStyle(color: Colors.white70),)),

                                      Align(alignment: Alignment.topRight,child: Text('الأسوأ', style: TextStyle(color: Colors.white70),)),

                                      Align(alignment: Alignment.topRight,child: Text('ميكانيكي', style: TextStyle(color: Colors.white70),)),















                                    ]















                                ),
                              ),



                            ),

                          ),
                        ),
                      )
]
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
