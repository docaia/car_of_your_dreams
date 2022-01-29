import 'dart:convert';
import 'package:car_of_your_dreams/widgets/bestDependability.dart';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'package:car_of_your_dreams/widgets/bestCars.dart';
import 'package:car_of_your_dreams/widgets/bestAgencies.dart';
import 'package:car_of_your_dreams/widgets/familyCars.dart';


class MySQL{
  // final settings = new ConnectionSettings(
      // host: '10.0.2.2',
      // port: 3306,
      // user: 'root',
      // password: '79789Vhs#',
      // db: 'crazycars'
  // );
  void extractData(String Make, String model, String year, int rate_tawkeel, int rate_depend) async{
    //var conn = await MySqlConnection.connect(settings);

   // var checkRecord = await conn.query
    //  ('SELECT * FROM crazycars.cars_egypt WHERE Manufacturer=? AND Model =? AND Year =?', [Make, model, year]);
//if(checkRecord.isEmpty ==true){
 // await conn.query('Insert into crazycars.cars_egypt(Manufacturer, Model, Year, Rating_Tawkeel) values(?,?,?,?)', [Make, model, year, rate]);
var url = 'https://carkenz.com/get.php';
var url2 = 'https://carkenz.com/updateSQL.php';
String ratz = rate_tawkeel.toString();
String raty = rate_depend.toString();
var ratingAll = (rate_tawkeel + rate_depend)/2;
var ratx = ratingAll.toString();
var dataToBeSent = {
  "Manufacturer": Make,
  "Model": model,
  "Year": year,
  "Rate_tawkeel": ratz,
  "Rate_dep": raty,
  "RatingAll": ratx
};

http.Response response = await http.post(Uri.parse(url), body: dataToBeSent);
var data = jsonDecode(response.body);
print(data);

if(data['Manufacturer']==Make){
  print("found it in database!");
String existingRateTawkeel = data['Rating_Agency'];
  String existingRateDependability = data['Rating_Dep'];

 dynamic existingRateT=double.parse(existingRateTawkeel);
  final updatedRate = ((existingRateT * 99) + rate_tawkeel) / 100; //Take current rating, average with last 100 ratings..
  var updatedRateString=updatedRate.toStringAsFixed(2);

  dynamic existingRateD=double.parse(existingRateDependability);
  final updatedRate2 = ((existingRateD * 99) + rate_depend) / 100; //Take current rating, average with last 100 ratings..
  var updatedRateString2=updatedRate2.toStringAsFixed(2);

  final updatedAverageNum = (updatedRate + updatedRate2)/2 ;
  var updatedAverage = updatedAverageNum.toStringAsFixed(2);

  Map rateUpdate = {
    "Manufacturer": Make,
    "Model": model,
    "Year": year,
    "updatedRateFromFlutter": updatedRateString,
    "updatedRateFromFlutter2": updatedRateString2,
    "updatedAverage": updatedAverage
  };
  http.Response updatedResponse = await http.post(Uri.parse(url2), body: rateUpdate);

} else{
 // print(response.body);
  print(response.body[2]);
}
  }

  Future<dynamic> sendResponse(String email, String password) async {
    var url = 'https://carkenz.com/signin.php';//'http://carstreasure.000webhostapp.com/signin.php';
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
    var url = 'https://carkenz.com/signup.php';
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
    var mechUrl ='https://carkenz.com/mechanic.php';
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
  Future<dynamic> extractCarDetails(String? Make) async {
    var url = 'https://carkenz.com/getCarDetails.php';

    var dataToBeSent = {
      "Manufacturer": Make,
    };

    http.Response response = await http.post(
        Uri.parse(url), body: dataToBeSent);
    var data = jsonDecode(response.body);



    //if(data['Manufacturer']==Make){
    //print("found it in database!");
    return data;
  }

  void carIssuesInSQL(String Make, String model, String year, String selectedIssue) async {
    var url = 'https://carkenz.com/carIssues.php';

    var dataToBeSent = {
      "Manufacturer": Make,
      "Model": model,
      "Year": year,
      "Issue": selectedIssue,
    };

    await http.post(Uri.parse(url), body: dataToBeSent);
  }

  Future<List<BestCars>> selectBestCars() async{
    var url = 'https://carkenz.com/selectBestCars.php';

    http.Response response = await http.post(
        Uri.parse(url), body: null);

    if (response.statusCode == 200) {
      List<dynamic> l = json.decode(response.body);
      print(l);
      List<BestCars> bestCarz = List<BestCars>.from(l.map((model)=> BestCars.fromJson(model)));
    return bestCarz;//BestCars.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the best cars, there seems to be an issue connecting to the server');
    }
      }
  Future<List<BestAgencies>> selectBestAgencies() async{
    var url = 'https://carkenz.com/selectBestAgencies.php';

    http.Response response = await http.post(
        Uri.parse(url), body: null);

    if (response.statusCode == 200) {
      List<dynamic> l = json.decode(response.body);
      print(l);
      List<BestAgencies> bestAgenciez = List<BestAgencies>.from(l.map((model)=> BestAgencies.fromJson(model)));
      return bestAgenciez;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the best agencies, there seems to be an issue connecting to the server');
    }
  }
  Future<dynamic> extractBestWorst(String? Make, String? Model, String? Year) async {
    var url = 'https://carkenz.com/getCarDetailsBestWorst.php';
    dynamic data;
    var dataToBeSent = {
      "Manufacturer": Make,
      "Model": Model,
      "Year": Year
    };

    http.Response response = await http.post(
        Uri.parse(url), body: dataToBeSent);

    if(response.body=="no data, something went wrong"){
      data = response.body;
    } else {
       data = jsonDecode(response.body);
    }

    return data;
  }

  Future<dynamic> getMechanicsForMyCar(String? Make, String? Model, String? Year) async {
    var url = 'https://carkenz.com/mechanicsOfOneCar.php';
    dynamic data;
    var dataToBeSent = {
      "Manufacturer": Make,
      "Model": Model,
      "Year": Year
    };

    http.Response response = await http.post(
        Uri.parse(url), body: dataToBeSent);
    if(response.body=="no mechanics aslan"){
       data = response.body;
    } else {
       data = jsonDecode(response.body);
    }


    //if(data['Manufacturer']==Make){
    //print("found it in database!");
    return data;
  }

  Future<List<BestDepend>> selectBestDependables() async{
    var url = 'https://carkenz.com/selectBestDependables.php';

    http.Response response = await http.post(
        Uri.parse(url), body: null);

    if (response.statusCode == 200) {
      List<dynamic> l = json.decode(response.body);
      print(l);
      List<BestDepend> bestdepz = List<BestDepend>.from(l.map((model)=> BestDepend.fromJson(model)));
      return bestdepz;//BestCars.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the best dependable cars, there seems to be an issue connecting to the server');
    }
  }

  Future<List<FamilyCars>> getFamilyCars() async{
    var url = 'https://carkenz.com/getFamilyCars.php';

    http.Response response = await http.post(
        Uri.parse(url), body: null);

    if (response.statusCode == 200) {
      List<dynamic> l = json.decode(response.body);
      print(l);
      List<FamilyCars> bestFam = List<FamilyCars>.from(l.map((model)=> FamilyCars.fromJson(model)));
      return bestFam;//BestCars.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the best family cars, there seems to be an issue connecting to the server');
    }
  }

}
