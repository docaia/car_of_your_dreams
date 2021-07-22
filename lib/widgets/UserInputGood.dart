import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:car_of_your_dreams/Services/change_notifier.dart';
import'package:car_of_your_dreams/widgets/Constants.dart';
import 'package:car_of_your_dreams/Services/Firebase.dart';

class UserInputGood extends StatelessWidget {
  @override
  UserInputGood({this.issueDescribe, this.toScreenNum, this.rightButtonText, this.goodOrBadList, this.selectedIssue});
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

                      value: Provider.of<CarsProvider>(context, listen: false).selectedIssueGood,
                      onChanged: (String newValue) {
                        Provider.of<CarsProvider>(context,listen: false).setSelectedItemGood(newValue);
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
                        FlatButton(onPressed: null,
                            child: Text("Skip", style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white)),)),
                        FlatButton(onPressed: ()async{Navigator.pushNamed(context, toScreenNum);
                         db.chosenProblem(context);},
                            child: Text(rightButtonText, style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),))
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
