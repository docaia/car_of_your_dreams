import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Screens/Car_Selection_Screen.dart';

class StarPressing{
  StarPressing({this.star, this.falseForAll,this.changeStatus});
  bool star;
  Function falseForAll;
  Function changeStatus;

  void starPressed(){
    falseForAll();
  changeStatus(star);
  star = CarsProvider().myToggle.isChecked;

  }

}