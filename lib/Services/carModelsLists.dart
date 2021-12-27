import 'package:car_of_your_dreams/widgets/CarModels.dart';
import 'package:flutter/material.dart';

List<String> years=['2022',
  '2021',
  '2020',
  '2019',
  '2018',
  '2017',
  '2016',
  '2015',
  '2014',
  '2013',
  '2012',
  '2011',
  '2010',
  '2009',
  '2008',
  '2007',
  '2006',
  '2005',
  '2004',
  '2003',
  '2002',
  '2001',
  '2000',
];
List<CarModel> mToyota = [CarModel('4 RUNNER'),
  CarModel('AURIS'),
  CarModel('AVALON'),
  CarModel('AVANZA'),
  CarModel('AVENSIS'),
  CarModel('C-HR'),
  CarModel('CAMRY'),
  CarModel('CELICA'),
  CarModel('COROLLA'),
  CarModel('CORONA'),
  CarModel('CRESSIDA'),
  CarModel('CROWN'),
  CarModel('ECHO'),
  CarModel('FJ CRUISER'),
  CarModel('FORTUNER'),
  CarModel('HIACE'),
  CarModel('HILUX'),
  CarModel('INNOVA'),
  CarModel('IQ'),
  CarModel('LAND CRUISER'),
  CarModel('PRADO'),
  CarModel('PREVIA'),
  CarModel('PRIUS'),
  CarModel('RAV 4'),
  CarModel('RUSH'),
  CarModel('SCION'),
  CarModel('STARLET'),
  CarModel('SUPRA'),
  CarModel('TACOMA'),
  CarModel('TERCEL'),
  CarModel('XA'),
  CarModel('YARIS'),
];
List<CarModel> mJEEP=[CarModel('CHEROKEE'),
  CarModel('COMMANDER'),
  CarModel('COMPASS'),
  CarModel('GRAND CHEROKEE'),
  CarModel('LIBERTY'),
  CarModel('PATRIOT'),
  CarModel('RENEGADE'),
  CarModel('WAGONEER'),
  CarModel('WRANGLER'),
];
List<CarModel> mKIA =[
  CarModel('CARENS'),
  CarModel('CARNIVAL'),
  CarModel('CEED'),
  CarModel('CERATO'),
  CarModel('CERATO COUPE'),
  CarModel('CLARUS'),
  CarModel('MOHAVE'),
  CarModel('OPRIUS'),
  CarModel('OPTIMA'),
  CarModel('PEGAS'),
  CarModel('PICANTO'),
  CarModel('PRIDE'),
  CarModel('RIO'),
  CarModel('SEPHIA'),
  CarModel('SHUMA'),
  CarModel('SORENTO'),
  CarModel('SOUL'),
  CarModel('SPECTRA'),
  CarModel('SPORTAGE'),
];
List<CarModel> mFIAT = [
  CarModel('TIPO'),
  CarModel('UNO'),
  CarModel('124'),
  CarModel('125'),
  CarModel('126'),
  CarModel('127'),
  CarModel('128'),
  CarModel('128 NOVA'),
  CarModel('1300'),
  CarModel('131'),
  CarModel('132'),
  CarModel('500'),
  CarModel('500C'),
  CarModel('500X'),
  CarModel('ALBEA'),
  CarModel('ARGENTA'),
  CarModel('BRAVA'),
  CarModel('BRAVO'),
  CarModel('CROMA'),
  CarModel('DOBLO'),
  CarModel('DOGAN'),
  CarModel('FIORINO'),
  CarModel('FLORIDA'),
  CarModel('GRAND PUNTO'),
  CarModel('LINEA'),
  CarModel('MAREA'),
  CarModel('PALIO'),
  CarModel('PANDA'),
  CarModel('PETRA'),
  CarModel('POLONEZ'),
  CarModel('PUNTO'),
  CarModel('QUBO'),
  CarModel('REGATA'),
  CarModel('RITMO'),
  CarModel('SHAHIN'),
  CarModel('SHINKO'),
  CarModel('SIENA'),
  CarModel('TEMPRA'),
  CarModel('ZASTAVA'),
];
List<CarModel> mHyundai = [
  CarModel('ACCENT'),
  CarModel('ATOS'),
  CarModel('AZERA'),
  CarModel('CENTENNIAL'),
  CarModel('COUPE'),
  CarModel('CRETA'),
  CarModel('ELANTRA /AVANTE'),
  CarModel('ELANTRA COUPE'),
  CarModel('EXCEL'),
  CarModel('GALLOPER'),
  CarModel('GENESIS'),
  CarModel('GETZ'),
  CarModel('GRAND I10'),
  CarModel('H1'),
  CarModel('H100'),
  CarModel('I10'),
  CarModel('I20'),
  CarModel('I30'),
  CarModel('I40'),
  CarModel('IX20'),
  CarModel('IX35'),
  CarModel('MATRIX'),
  CarModel('PONY'),
  CarModel('SANTA FE'),
  CarModel('SANTAMO'),
  CarModel('SOLARIS'),
  CarModel('SOLATI (H350)'),
  CarModel('SONATA'),
  CarModel('STELLAR'),
  CarModel('TERRACAN'),
  CarModel('TIBURON'),
  CarModel('TRAJET'),
  CarModel('TUCSON'),
  CarModel('VELOSTER'),
  CarModel('VERNA'),
  CarModel('VIVA'),
];
List<CarModel> mMercedes =[
  CarModel('190'),
  CarModel('200'),
  CarModel('230'),
  CarModel('A150'),
  CarModel('A180'),
  CarModel('A200'),
  CarModel('B150'),
  CarModel('B160'),
  CarModel('B200'),
  CarModel('C180'),
  CarModel('C200'),
  CarModel('C230'),
  CarModel('C240'),
  CarModel('C250'),
  CarModel('C280'),
  CarModel('C300'),
  CarModel('C350'),
  CarModel('CL-CLASS'),
  CarModel('CLA 180'),
  CarModel('CLA 200'),
  CarModel('CLC-CLASS'),
  CarModel('CLK-CLASS'),
  CarModel('CLS'),
  CarModel('E 180'),
  CarModel('E200'),
  CarModel('E220'),
  CarModel('E 230'),
  CarModel('E 240'),
  CarModel('E 250'),
  CarModel('E 280'),
  CarModel('E 300'),
  CarModel('E 320'),
  CarModel('E 350'),
  CarModel('E 400'),
  CarModel('GL-CLASS'),
  CarModel('GLA 200'),
  CarModel('GLC 200'),
  CarModel('GLC 250'),
  CarModel('GLC 300'),
  CarModel('GLE- CLASS'),
  CarModel('GLK 250'),
  CarModel('GLK 300'),
  CarModel('GLK 350'),
  CarModel('M- CLASS'),
  CarModel('MAYBACH'),
  CarModel('R-CLASS'),
  CarModel('S280'),
  CarModel('S300'),
  CarModel('S320'),
  CarModel('S350'),
  CarModel('S400'),
  CarModel('S450'),
  CarModel('S500'),
  CarModel('S560'),
  CarModel('SEL 200'),
  CarModel('SEL 260'),
  CarModel('SEL 280'),
  CarModel('SEL 300'),
  CarModel('SEL 500'),
  CarModel('SEL 1001'),
  CarModel('SL-CLASS'),
  CarModel('SLC-CLASS'),
  CarModel('SLK-CLASS'),
  CarModel('VIANO'),

];

List<CarModel> mBMW = [
  CarModel('116'),
  CarModel('118'),
  CarModel('120'),
  CarModel('218'),
  CarModel('316'),
  CarModel('318'),
  CarModel('320'),
  CarModel('325'),
  CarModel('328'),
  CarModel('330'),
  CarModel('335'),
  CarModel('340'),
  CarModel('418'),
  CarModel('518'),
  CarModel('520'),
  CarModel('523'),
  CarModel('525'),
  CarModel('528'),
  CarModel('530'),
  CarModel('535'),
  CarModel('540'),
  CarModel('545'),
  CarModel('550'),
  CarModel('630'),
  CarModel('640'),
  CarModel('645'),
  CarModel('650'),
  CarModel('730'),
  CarModel('735'),
  CarModel('740'),
  CarModel('745'),
  CarModel('750'),
  CarModel('M3'),
  CarModel('M5'),
  CarModel('X1'),
  CarModel('X2'),
  CarModel('X3'),
  CarModel('X4'),
  CarModel('X5'),
  CarModel('X6'),
  CarModel('Z3'),
  CarModel('Z4'),
];
List<CarModel> mSEAT=[
  CarModel('Ibiza'),
  CarModel('Arona'),
  CarModel('Leon'),
  CarModel('Ateca'),
  CarModel('Tarraco'),
  CarModel('Cupra - Leon'),
];
List<CarModel> mVolksWagen=[
  CarModel('Golf'),
  CarModel('Passat'),
  CarModel('Polo'),
  CarModel('Pointer'),
  CarModel('Jetta'),
  CarModel('Tiguan'),
  CarModel('Touareg'),
];
List<CarModel> mPeugeot =[
  CarModel('301'),
  CarModel('508'),
  CarModel('2008'),
  CarModel('3008'),
  CarModel('5008'),
];
List<CarModel> mNissan = [
  CarModel('Sunny'),
  CarModel('Sentra'),
  CarModel('Juke'),
  CarModel('Qashqai'),
  CarModel('Patrol'),
];