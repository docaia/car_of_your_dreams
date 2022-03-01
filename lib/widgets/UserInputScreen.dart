import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';
import 'package:car_of_your_dreams/Services/mySQL_setup.dart';

class UserInputScreen extends StatelessWidget {
  @override
  UserInputScreen({required this.issueDescribe, required this.toScreenNum, required this.rightButtonText, required this.goodOrBadList, required this.selectedIssue});
  final String issueDescribe;
  final String toScreenNum;
  final String rightButtonText;
  final String selectedIssue;

  final List<String> goodOrBadList;
Db db = Db();
    Widget build(BuildContext context) {
    return Material(
        child: Scaffold(backgroundColor: Colors.blueAccent,
          body: Container(
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Column(
              children: [
                Container( decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Padding(
                    padding: const EdgeInsets.only(right:16, top:8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed:(){

                          Navigator.pushNamed(context, '1');
                        },
                            style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.lightBlueAccent) ),
                            child: Text("Back to Home")),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: RichText(
                    text: TextSpan(
                      text: ' ${Provider
                          .of<CarsProvider>(context, listen: true)
                          .currentCarManufacturer.data}', style:GoogleFonts.eastSeaDokdo(textStyle:TextStyle(fontSize: 40, color: Colors.white, fontWeight:FontWeight.w500 )  ),
                      children: <TextSpan>[
                        TextSpan(text:'  ${Provider
                            .of<CarsProvider>(context, listen: false)
                            .myModel.data}', style:GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 25, color: Colors.white70, fontWeight:FontWeight.w400 )  ), ),
                        TextSpan(text:'  ${Provider
                            .of<CarsProvider>(context, listen: false)
                            .myYear.data}', style:GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 25, color: Colors.blueGrey, fontWeight:FontWeight.w400 )  ), ),
                      ],),
                  ),
                ),
                Text(issueDescribe, style: GoogleFonts.publicSans(
                  textStyle: TextStyle(
                      backgroundColor: Colors.blueAccent,
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none

                  ),),
                ),
Expanded(
  child:DropdownButton<String>(
    style: TextStyle(color: Colors.white, fontSize: 18),
    dropdownColor: Colors.black87,
    icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 35,),

    value: Provider.of<CarsProvider>(context, listen: false).selectedIssueBad,
    onChanged: (String? newValue) {
    Provider.of<CarsProvider>(context,listen: false).setSelectedItem(newValue!);
    },
    items: goodOrBadList
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    })
    .toList(),
    )



),
                Expanded(
                  flex:1,
                  child: Visibility(
                    visible: selectedIssue == 'Other, please specify'? true: false,
                    child: TextField(
                      decoration: kMessageTextFieldDecoration,

                      onChanged: (value){
                        Provider.of<CarsProvider>(context,listen: false).userFeedback = value;
                        print(Provider.of<CarsProvider>(context,listen: false).userFeedback);
                      },

                    ),
                  ),
                ),

                Container(

                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget> [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,0,8),
                          child: TextButton(onPressed: ()async{Navigator.pushNamed(context, toScreenNum);},
                              style: ButtonStyle(side: MaterialStateProperty.all(BorderSide() )),
                              child: Text("Skip", style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,8.0,8),
                          child: TextButton(onPressed: ()async{Navigator.pushNamed(context, toScreenNum);
                          print("${Provider.of<CarsProvider>(context, listen: false).selectedIssueBad!}");
                       // db.chosenProblem(context);
                          MySQL().carIssuesInSQL(
                              Provider.of<CarsProvider>(context, listen: false).currentCarManufacturer.data!,
                              Provider.of<CarsProvider>(context, listen: false).myModel.data!,
                              Provider.of<CarsProvider>(context, listen: false).myYear.data!,
                              Provider.of<CarsProvider>(context, listen: false).selectedIssueBad!);

                          },
                              style: ButtonStyle(side: MaterialStateProperty.all(BorderSide() )),
                              child: Text(rightButtonText, style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),)),
                        )

      ]
                  ),

                )
              ],
            ),
          ),
        )
    );
  }
}
