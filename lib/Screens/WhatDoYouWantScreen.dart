import 'package:car_of_your_dreams/widgets/language_buttons.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:provider/provider.dart';

import '../widgets/FancyButtonWidget.dart';
import '../widgets/MainButtons.dart';
import 'NarrowScreenLayout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../Services/translation_service.dart';

class WhatDoYouWant extends StatefulWidget {

  @override
  State<WhatDoYouWant> createState() => _WhatDoYouWantState();
}

class _WhatDoYouWantState extends State<WhatDoYouWant> {
  List<LanguageButtons> languages =[LanguageButtons('ع', 'ar', 'AR'),
    LanguageButtons('es', 'es', 'ES'),
    LanguageButtons('en', 'en', 'En'),];

  List<MainButtons> mainList =[
    MainButtons(desc: Icon(Icons.home), path: 'home'),
    MainButtons(desc: Icon(Icons.list), path: 'mechResults'),
    MainButtons(desc: Icon(Icons.rate_review), path: '8'),
    MainButtons(desc: Icon(Icons.car_rental), path: '1'),
  ];

  var dropDownLang;
  var dropDownMain;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return Container(
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(color: Colors.white10),
              child: Container(
                decoration: BoxDecoration(color: Colors.white10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(decoration: BoxDecoration(
                          color: Colors.blueAccent),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16, top: 8),
                          child: Stack(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding:  EdgeInsets.fromLTRB(8,16.0,0, 0),
                                      child: DropdownButton<IconData>(
                                        value: dropDownMain,
                                        icon: Icon(Icons.menu),
                                        underline: Container(),
                                        onChanged: (IconData? newValue) {
                                          setState(() {
                                            dropDownMain = newValue;
                                            if(newValue==Icons.home){Navigator.pushNamed(context, 'home');}
                                            if(newValue==Icons.list){Navigator.pushNamed(context, 'mechResults');}
                                            if(newValue==Icons.rate_review){Navigator.pushNamed(context, '8');}
                                            if(newValue==Icons.car_rental){Navigator.pushNamed(context, '1');}
                                          });
                                        },
                                        items: <IconData>[Icons.home, Icons.list, Icons.rate_review, Icons.car_rental].map<DropdownMenuItem<IconData>>((IconData value) {
                                          return DropdownMenuItem<IconData>(
                                            value: value,
                                            child: Icon(value),
                                          );
                                        }).toList(),
                                      )


                                  ),
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
                                  DropdownButton<String>(
                                      value: dropDownLang,
                                      hint:Text('Language', style: TextStyle(fontWeight: FontWeight.w700)),
                                      icon: Icon(Icons.abc),
                                      style:TextStyle(color: Colors.white) ,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropDownLang = newValue;
                                          if(dropDownLang=='es') {
                                            Get.updateLocale(
                                                Locale('es', 'ES'));
                                          } else if(dropDownLang=='ع') {
                                            Get.updateLocale(
                                                Locale('ar', 'AR'));
                                          }
                                            else if(dropDownLang=='en'){
                                            Get.updateLocale(
                                                Locale('en', 'En'));
                                          }

                                        });
                                      },
                                      items: languages.map((LanguageButtons item){
                                        return DropdownMenuItem<String>(
                                          value: item.text,
                                          child: Container(
                                              color: Colors.blueAccent,
                                              child: Text(item.text)),
                                        );
                                      }
                                      ).toList()
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     Get.updateLocale(Locale('es', 'ES'));
                                  //   },
                                  //   child: Text(
                                  //     'change_language'.tr,
                                  //     style: TextStyle(fontSize: 20),
                                  //   ),
                                  // ),

                                  // ElevatedButton(onPressed: () {
                                  //   Navigator.pushNamed(context, '1');
                                  // },
                                  //     style: ButtonStyle(
                                  //         backgroundColor: MaterialStateProperty
                                  //             .all<Color>(
                                  //             Colors.lightBlueAccent)),
                                  //     child: Text(
                                  //         " شوف إحصائيات أكثر (تجريبي)")),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Align(alignment: Alignment.center,
                          child: Text('title'.tr,
                            style: TextStyle(fontSize: MediaQuery
                                .of(context)
                                .size
                                .width * 0.08),)),

                      FancyButtonWidget(route: 'mechResults',
                          label: AppLocalizations.of(context)!.shoof,//'شوف الأعلي تقييماً',
                          imagen: 'Images/auto-repair-shop.jpg'),
                      SizedBox(height: 15,),
                      FancyButtonWidget(route: '8',
                          label: 'rate'.tr,//'قيم الميكانيكيين',
                          imagen: 'Images/smiles.jpg'),
                      SizedBox(height: 15,),
                      FancyButtonWidget(route: '1',
                          label: 'cars'.tr,
                          imagen: 'Images/Egypt-cairo-traffic.jpg'),

                      SizedBox(height: 100,),
                      Text('promo'.tr, style: TextStyle(fontSize: 50),),
                      SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            );
          } else {
            return NarrowScreenLayout();
          }
        }),
    ),
    );
  }
}



