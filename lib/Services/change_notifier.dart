import 'package:car_of_your_dreams/widgets/StarRating_toggle.dart';
import 'package:car_of_your_dreams/widgets/bestAgencies.dart';
import 'package:car_of_your_dreams/widgets/bestDependability.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Screens/Car_Selection_Screen.dart';
import 'package:car_of_your_dreams/widgets/bestCars.dart';
import 'package:convert/convert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';
import 'package:car_of_your_dreams/widgets/Manufacturers.dart';
import 'package:car_of_your_dreams/Services/carModelsLists.dart';
import 'package:car_of_your_dreams/widgets/CarModels.dart';
import 'package:car_of_your_dreams/widgets/familyCars.dart';

class CarsProvider extends ChangeNotifier {
  //put here the main variables and the car list
String communityRating = "Choose";
String? bestCars;
String mech ="";
String? userEmail;
String? userPassword;
String name="user";
String mechPhone="";
String mechLocation="";
int? itemNum = 0;
bool questionMarkVisibility = false;
bool questionFamilyVisibility = false;
void visibilityChanger(bool hovered){
  questionMarkVisibility = hovered;
  notifyListeners();
}
void visibilityFamilyChanger(bool hovered){
  questionFamilyVisibility = hovered;
  notifyListeners();
}

int? makeItemzero(int? gg){
  gg = 0;
  notifyListeners();
  return gg;

}

List<BestCars> bestCarsList=[BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
];
List<BestAgencies> bestAgenciesList = [
  BestAgencies(Man: '', Agency: '', Rate: ''),
  BestAgencies(Man: '', Agency: '', Rate: ''),
  BestAgencies(Man: '', Agency: '', Rate: ''),
  BestAgencies(Man: '', Agency: '', Rate: ''),
  BestAgencies(Man: '', Agency: '', Rate: ''),
];

List<BestDepend> bestDepList=[BestDepend(Man: '', Model: '', year: '', Rate: ''),
BestDepend(Man: '', Model: '', year: '', Rate: ''),
BestDepend(Man: '', Model: '', year: '', Rate: ''),
BestDepend(Man: '', Model: '', year: '', Rate: ''),
BestDepend(Man: '', Model: '', year: '', Rate: ''),
];

List<FamilyCars> bestFamList=[FamilyCars(Man: '', Model: '', year: '', Rate: ''),
  FamilyCars(Man: '', Model: '', year: '', Rate: ''),
  FamilyCars(Man: '', Model: '', year: '', Rate: ''),
  FamilyCars(Man: '', Model: '', year: '', Rate: ''),
  FamilyCars(Man: '', Model: '', year: '', Rate: ''),
];
List<String> goodCars = [];
  ////Read excel sheet!!///


  int model = 0;
  Text currentCarManufacturer = Text('Toyota');
  Text myYear = Text('2022');
  Text myModel = Text('Camry');
  String? userFeedback;
  List<Text> models = [ Text('Camry', style: kStyle,),
    Text('Corolla', style: kStyle,),
    Text('Yaris', style: kStyle,),
    Text('Runner', style: kStyle,)];
  bool star1IsChecked = false;
  bool star2IsChecked = false;
  bool star3IsChecked = false;
  bool star4IsChecked = false;
  bool star5IsChecked = false;

bool dep1IsChecked = false;
bool dep2IsChecked = false;
bool dep3IsChecked = false;
bool dep4IsChecked = false;
bool dep5IsChecked = false;

bool criteriaVisibility = false;
bool criteriaVisibilityAgencies = false;
bool depVisibility = false;
bool famVisibility = false;

  List<Manufacturers> manufacturers =
  [
Manufacturers('Toyota', mToyota),Manufacturers('JEEP', mJEEP), Manufacturers('KIA', mKIA), Manufacturers('FIAT', mFIAT), Manufacturers('Hyundai', mHyundai), Manufacturers('Mercedes', mMercedes),Manufacturers('BMW', mBMW), Manufacturers('SEAT', mSEAT), Manufacturers('VolksWagen', mVolksWagen),Manufacturers('Peugeot', mPeugeot), Manufacturers('Nissan', mNissan), Manufacturers('Suzuki', mSuzuki),
  ];
List<Text> manuf(){
  List<Text> hh=[];
  for (int i = 0; i < manufacturers.length; i++) {
    hh.add(Text(manufacturers[i].name)) ;
  };
  return hh;
}
  List<Text> year = [
    Text('2022', style: kStyle,),
    Text('2021', style: kStyle,),
    Text('2020', style: kStyle,),
    Text('2019', style: kStyle,),
    Text('2018', style: kStyle,),
    Text('2017', style: kStyle,),
    Text('2016', style: kStyle,),
    Text('2015', style: kStyle,),
    Text('2014', style: kStyle,),
    Text('2013', style: kStyle,),
    Text('2012', style: kStyle,),
    Text('2011', style: kStyle,),
    Text('2010', style: kStyle,),
    Text('2009', style: kStyle,),
    Text('2008', style: kStyle,),
    Text('2007', style: kStyle,),
    Text('2006', style: kStyle,),
    Text('2005', style: kStyle,),
    Text('2004', style: kStyle,),
    Text('2003', style: kStyle,),
    Text('2002', style: kStyle,),
    Text('2001', style: kStyle,),
    Text('2000', style: kStyle,),

  ];

 List<CarModel>?modelsforManu (Text Manufacturer) {
  //search through the current manufacturers until you find the selected manufacturer, assign its models to a list
  for (int i = 0; i < manufacturers.length; i++) {
    if (manufacturers[i].name == Manufacturer.data) {
      return manufacturers[i].models;
    }

  }

}
  List<Text> modelSelection(Text Manufacturer) {
    List<CarModel>? hh = modelsforManu(Manufacturer);

    //convert the models list to a List<Text>
    List<Text> modelsInText = [];
    for (int i = 0; i < hh!.length; i++) {
      modelsInText.add(Text(hh[i].name)) ;
    };
    notifyListeners();
   return modelsInText;

  }

  StarRatingToggle myToggle = StarRatingToggle();
StarRatingToggle myToggleDependability = StarRatingToggle();

  void starStatusChange(bool isChecked1) {
    myToggle.ratingToggle();
    isChecked1 = myToggle.isChecked;
    notifyListeners();
  }
void starStatusChangeDep(bool isChecked1) {
  myToggleDependability.ratingToggle();
  isChecked1 = myToggleDependability.isChecked;
  notifyListeners();
}

  void falseAll() {
    star1IsChecked = false;
    star2IsChecked = false;
    star3IsChecked = false;
    star4IsChecked = false;
    star5IsChecked = false;
    myToggle.isChecked = false;
  }

void falseAllD() {
  dep1IsChecked = false;
  dep2IsChecked = false;
  dep3IsChecked = false;
  dep4IsChecked = false;
  dep5IsChecked = false;
  myToggleDependability.isChecked = false;
}
int i = -1;
  Future getBest(List<dynamic> gg, BuildContext context) async {
  gg = bestCarsList;
  criteriaVisibility =!criteriaVisibility;
    // await gg(elem){};
  // map(
  //         (elem)
  //     {print(elem.data());
  //     i = i+1;
  //    // List<BestCars> BC = List<BestCars>.from(gg.map((model)=> BestCars.fromJson(model)));
  //     bestCarsList[i]=(BestCars(elem['0'], elem['1'], elem['2'], elem['3'].toStringAsFixed(2)));
  //
  //
  //     });
   notifyListeners();
}

Future getBestAg(List<dynamic> gg, BuildContext context) async {
  gg = bestAgenciesList;
  criteriaVisibilityAgencies =!criteriaVisibilityAgencies;

  notifyListeners();
}
Future getBestdep(BuildContext context) async {
  //gg = bestDepList;
  depVisibility=!depVisibility;
  notifyListeners();
}
Future getBestfam(BuildContext context) async {
  famVisibility=!famVisibility;
  notifyListeners();
}
List<String> problemsList =[
  'Noisy',
  'Brakes are weak',
  'Heat issues',
  'Not stable at high speeds',
  'Too slow acceleration',
  'Too close to ground',
  'Tight seating',
  'Small storage space',
  'High fuel consumption',
  'Other, please specify',
];
  List<String> advantagesList =[
    'No unexpected problems',
    'Stable at high speeds',
    'Good acceleration',
    'Big storage space',
    'Comfortable and large seats',
    'Efficient fuel consumption',
    'Other, please specify',
  ];

  String selectedIssueGood = 'No unexpected problems';
  String selectedIssueBad = 'Noisy';
//List<String> get items => problemsList;
String? get selected => selectedIssueBad;

void setSelectedItem(String s) {

  selectedIssueBad = s;
  notifyListeners();
}

  void setSelectedItemGood(String s) {

    selectedIssueGood = s;
    notifyListeners();
  }
  late int tightSeating;
  late int Noisy;


  showToast() {
    Fluttertoast.showToast(
        msg: 'email or password are not registered',
        toastLength: Toast.LENGTH_LONG,
        fontSize: 25,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        webBgColor: "linear-gradient(to right, #b00c00,#b00c00)",
      webPosition: "center",

    );
  }

}



