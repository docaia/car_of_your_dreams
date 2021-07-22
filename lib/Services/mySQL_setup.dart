import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'package:car_of_your_dreams/widgets/caro.dart';


class MySQL{
  // final settings = new ConnectionSettings(
      // host: '10.0.2.2',
      // port: 3306,
      // user: 'root',
      // password: '79789Vhs#',
      // db: 'crazycars'
  // );
  void extractData(String Make, String model, String year, int rate) async{
    //var conn = await MySqlConnection.connect(settings);

   // var checkRecord = await conn.query
    //  ('SELECT * FROM crazycars.cars_egypt WHERE Manufacturer=? AND Model =? AND Year =?', [Make, model, year]);
//if(checkRecord.isEmpty ==true){
 // await conn.query('Insert into crazycars.cars_egypt(Manufacturer, Model, Year, Rating_Tawkeel) values(?,?,?,?)', [Make, model, year, rate]);
var url = 'http://carstreasure.000webhostapp.com/get.php';
var url2 = 'http://carstreasure.000webhostapp.com/updateSQL.php';
String ratz = rate.toString();
var dataToBeSent = {
  "Manufacturer": Make,
  "Model": model,
  "Year": year,
  "Rate": ratz,
};

http.Response response = await http.post(Uri.parse(url), body: dataToBeSent);
var data = jsonDecode(response.body);
print(data);

if(data['Manufacturer']==Make){
  print("found it in database!");
String existingRateString = data['Rating_all'];
 dynamic existingRate=double.parse(existingRateString);
  final updatedRate = ((existingRate * 99) + rate) / 100; //Take current rating, average with last 100 ratings..
  var updatedRateString=updatedRate.toStringAsFixed(2);
  Map rateUpdate = {
    "Manufacturer": Make,
    "Model": model,
    "Year": year,
    "updatedRateFromFlutter": updatedRateString
  };
  http.Response updatedResponse = await http.post(Uri.parse(url2), body: rateUpdate);

} else{
 // print(response.body);
  print(response.body[2]);
}
  }

  Future<dynamic> sendResponse(String email, String password) async {
    var url = 'http://carstreasure.000webhostapp.com/signin.php';
    var data = {
      "email": "$email",
      "password": "$password"
    };

    http.Response credentials = await http.post(Uri.parse(url), body: data, headers: {"Accept":"application/json"});
    if (credentials.statusCode == 200) {
      //print(json.decode(credentials.body));
    } else {
      print(credentials.statusCode);
    }

    var credsFromDatabase = await jsonDecode(credentials.body);

    return credsFromDatabase;
  }
// website password is ohroCy4gOVhqQNbLHE4Y
  Future<dynamic> signUp(String name, String email, String password) async {
    var url = 'http://carstreasure.000webhostapp.com/signup.php';
    var data = {
      "name": "$name",
      "email": "$email",
      "password": "$password"
    };

  String zuzu= await postRequest(url, data);
  return zuzu;

  }
  Future<dynamic> mechanicInfo(String mechName, String mechPhone, String mechLocation, String Make, String model, String year){
    var mechInfo={
      "mechName": mechName,
      "mechPhone": mechPhone,
      "mechLocation": mechLocation,
      "Manufacturer": Make,
      "Model": model,
      "Year": year,
    };
    var mechUrl ='http://carstreasure.000webhostapp.com/mechanic.php';
    var mechanicInsert = postRequest(mechUrl, mechInfo);
    return mechanicInsert;
  }

  Future<dynamic> postRequest(String url, Map data) async{
    http.Response credentials = await http.post(Uri.parse(url), body: data, headers: {"Accept":"application/json"});
    if (credentials.statusCode == 200) {
      var signUpResponse = await jsonDecode(credentials.body);
      return signUpResponse;
    } else {
      print(credentials.statusCode);
    }
  }
}
