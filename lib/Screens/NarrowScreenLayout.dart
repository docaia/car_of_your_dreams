import 'package:car_of_your_dreams/widgets/FancyButtonWidgetNarrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_of_your_dreams/widgets/language_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NarrowScreenLayout extends StatefulWidget {
  @override
  State<NarrowScreenLayout> createState() => _NarrowScreenLayoutState();
}

class _NarrowScreenLayoutState extends State<NarrowScreenLayout> {
  List<LanguageButtons> languages =[LanguageButtons('ع', 'ar', 'AR'),
    LanguageButtons('es', 'es', 'ES'),
    LanguageButtons('en', 'en', 'En'),];

  var dropDownLang;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body:Container(
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

                  FancyButtonWidgetNarrow(route: 'mechResults',
                      label: AppLocalizations.of(context)!.shoof,
                      imagen: 'Images/auto-repair-shop.jpg'),
                  SizedBox(height: 15,),
                  FancyButtonWidgetNarrow(route: '8',
                      label: 'rate'.tr,
                      imagen: 'Images/smiles.jpg'),
                  SizedBox(height: 15,),
                  FancyButtonWidgetNarrow(route: '1',
                      label: 'cars'.tr,
                      imagen: 'Images/Egypt-cairo-traffic.jpg'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
