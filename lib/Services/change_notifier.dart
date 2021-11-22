import 'package:car_of_your_dreams/widgets/StarRating_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Screens/Car_Selection_Screen.dart';
import 'package:car_of_your_dreams/widgets/bestCars.dart';
import 'package:convert/convert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';

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

List<BestCars> bestCarsList=[BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
  BestCars(Man: '', Model: '',year: '', Rate:''),
];
List<String> goodCars = [];
  ////Read excel sheet!!///
  List<Text> MercedesModels = [
    Text('190'),
    Text('200'),
    Text('230'),
    Text('A150'),
    Text('A180'),
    Text('A200'),
    Text('B150'),
    Text('B160'),
    Text('B200'),
    Text('C180'),
    Text('C200'),
    Text('C230'),
    Text('C240'),
    Text('C250'),
    Text('C280'),
    Text('C300'),
    Text('C350'),
    Text('CL-CLASS'),
    Text('CLA 180'),
    Text('CLA 200'),
    Text('CLC-CLASS'),
    Text('CLK-CLASS'),
    Text('CLS'),
    Text('E 180'),
    Text('E200'),
    Text('E220'),
    Text('E 230'),
    Text('E 240'),
    Text('E 250'),
    Text('E 280'),
    Text('E 300'),
    Text('E 320'),
    Text('E 350'),
    Text('E 400'),
    Text('GL-CLASS'),
    Text('GLA 200'),
    Text('GLC 200'),
    Text('GLC 250'),
    Text('GLC 300'),
    Text('GLE- CLASS'),
    Text('GLK 250'),
    Text('GLK 300'),
    Text('GLK 350'),
    Text('M- CLASS'),
    Text('MAYBACH'),
    Text('R-CLASS'),
    Text('S280'),
    Text('S300'),
    Text('S320'),
    Text('S350'),
    Text('S400'),
    Text('S450'),
    Text('S500'),
    Text('S560'),
    Text('SEL 200'),
    Text('SEL 260'),
    Text('SEL 280'),
    Text('SEL 300'),
    Text('SEL 500'),
    Text('SEL 1001'),
    Text('SL-CLASS'),
    Text('SLC-CLASS'),
    Text('SLK-CLASS'),
    Text('VIANO'),
  ];
  List<Text> BMWModels = [
    Text('116'),
    Text('118'),
    Text('120'),
    Text('218'),
    Text('316'),
    Text('318'),
    Text('320'),
    Text('325'),
    Text('328'),
    Text('330'),
    Text('335'),
    Text('340'),
    Text('418'),
    Text('518'),
    Text('520'),
    Text('523'),
    Text('525'),
    Text('528'),
    Text('530'),
    Text('535'),
    Text('540'),
    Text('545'),
    Text('550'),
    Text('630'),
    Text('640'),
    Text('645'),
    Text('650'),
    Text('730'),
    Text('735'),
    Text('740'),
    Text('745'),
    Text('750'),
    Text('M3'),
    Text('M5'),
    Text('X1'),
    Text('X2'),
    Text('X3'),
    Text('X4'),
    Text('X5'),
    Text('X6'),
    Text('Z3'),
    Text('Z4'),

  ];
  int model = 0;
  Text currentCarManufacturer = Text('Toyota');
  Text myYear = Text('2005');
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

  List<Text> manufacturers = [
    Text('Toyota', style: kStyle,),
    Text('VolksWagen', style: kStyle,),
    Text('Nissan', style: kStyle,),
    Text('Renault', style: kStyle,),
    Text('Mercedes', style: kStyle,),
    Text('BMW', style: kStyle,)
  ];
  List<Text> volksWagenModels = [
    Text('Golf', style: kStyle,),
    Text('Passat', style: kStyle,),
    Text('Polo', style: kStyle,),
    Text('Pointer', style: kStyle,),
    Text('Jetta', style: kStyle,),
    Text('Tiguan', style: kStyle,),
    Text('Touareg', style: kStyle,),
  ];
  List<Text> toyotaModels = [
    Text('Camry', style: kStyle,),
    Text('Corolla', style: kStyle,),
    Text('Yaris', style: kStyle,),
    Text('Runner', style: kStyle,)
  ];
  List<Text> NissanModels = [
    Text('Sunny', style: kStyle,),
    Text('Sentra', style: kStyle,),
    Text('Juke', style: kStyle,),
    Text('Qashqay', style: kStyle,),
    Text('Patrol', style: kStyle,),
  ];

  List<Text> RenaultModels = [
    Text('Megane', style: kStyle,),
    Text('Logan', style: kStyle,),
    Text('Duster', style: kStyle,),
    Text('Captur', style: kStyle,),
  ];
  List<Text> year = [
    Text('2005', style: kStyle,),
    Text('2010', style: kStyle,),
    Text('2015', style: kStyle,),
    Text('2020', style: kStyle,)
  ];

  List<Text> modelSelection(Text Manufacturer) {
    List<Text>theModel = [Text('hdsflhsdjf')];

    if(Manufacturer.data == "Toyota") {theModel = toyotaModels;}
    else if(Manufacturer.data == "VolksWagen") {theModel = volksWagenModels;}
    else if(Manufacturer.data == "Nissan") {theModel = NissanModels;}
    else if(Manufacturer.data == "Renault") {theModel = RenaultModels;}
    else if(Manufacturer.data == "Mercedes") {theModel = MercedesModels;}
    else if(Manufacturer.data == "BMW") {theModel = BMWModels;}
    else theModel =[Text('wong')];
    notifyListeners();
//    print(theModel);
    return theModel;
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
int i = -1;
  Future getBest(List<dynamic> gg, BuildContext context) async {
  gg = bestCarsList;
  criteriaVisibility =true;
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



