import 'dart:ui';

import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locale = Locale('en', 'US');

  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'rate': 'Rate mechanics',
      'cars': 'Cars',
      'change_language': 'Change Language',
      'title': 'Cars Treasure',
      'name': 'Name   ',
      'mech': 'Mechanic',
      'ws': 'Workshop',
      'phone': 'Phone',
      'loc': 'Where',
      'loc_disc': 'Address or zone',
      'spec':'Specialty',
      'mechTitle':'Who did you visit',
      'mechTakhasos':'mechanic',
      'elecTakhasos':'electrician',
      'samkary':'car body',
      'car': 'Car',
      'manu':'Manufacturer',
      'model':'Model',
      'year':'Year',
      'map':'Record location from maps',
      'opinion':'What do you think',
      'send':'Send!',
      'promo':'Know the top rated car mechanics in your area',
      'home':'Home'
    },
    'es_ES': {
      'rate': 'Clasifica',
      'cars': 'Vehiculos',
      'change_language': 'Cambiar Idioma',
      'title': 'Tesoro de Autos',
      'name': 'Nombre   ',
      'mech': 'Mechanico',
      'ws': 'Taller',
      'phone': 'Telefono',
      'loc': 'Donde',
      'loc_disc': 'direccion o zona',
      'spec': 'Especialidad',
      'mechTitle':'¿Quien visitaste?',
      'mechTakhasos':'mechanico',
     'elecTakhasos':'electrico',
     'samkary':'cuerpo de coche',
      'car': 'Carro',
      'manu':'Fabricante',
      'model':'Modelo',
      'year':'Año',
      'map':'Grabar ubicación desde mapas',
      'opinion':'¿Que piensas?',
      'send':'¡Enviar!',
      'promo':'Conoces los mejores mecanicos de autos en tu area',
      'home':'Principal'
    },
    'ar_AR':{
      'rate': 'قيم الميكانيكي',
      'cars': 'عربيات',
      'change_language': 'غير اللغه',
      'title':'كنز السيارات',
      'name': '   الإسم',
      'mech': 'الميكانيكي',
      'ws': 'الورشه',
      'phone': 'تليفون',
      'loc': 'فين',
      'loc_disc':'عنوان أو منطقه',
      'spec': 'تخصصه',
      'mechTitle':'كنت عند مين؟',
      'mechTakhasos':'ميكانيكا',
      'elecTakhasos':'كهربائي',
      'samkary':'سمكري',
      'car': 'العربيه',
      'manu':'الصانع',
      'model':'الطراز',
      'year':'السنه',
      'map':'سجل المكان من الخرائط',
      'opinion':'إيه رأيك',
      'send':'!إبعت',
      'promo':'إعرف الميكانيكيين الأعلي تقييماً في منطقتك',
      'home':'الرئيسيه'
    }
  };
}