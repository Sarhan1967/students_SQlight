import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class StudentDetails extends StatefulWidget {

  String screenTitle;
  StudentDetails(this.screenTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Students(screenTitle);
  }
}

class Students extends State<StudentDetails>{
  String screenTitle;
  Students(this.screenTitle);

  static var _status={"successes","failed"};
  TextEditingController studentName=new TextEditingController();
  TextEditingController studentDetails=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle? textStyle = Theme.of(context).textTheme.headline6;

    return
      new WillPopScope(
        onWillPop:()async {
          //debugPrint("WillPopScope Button");
          goBack();
          return false;
          },
          child: Scaffold(
          appBar: AppBar(
            title: Text(screenTitle
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                goBack();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: DropdownButton(
                    items: _status.map((String dropDownItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownItem,
                        child: Text(dropDownItem),
                      );}).toList(),

                    style: textStyle,
                    value: 'successes',
                    onChanged: (selectedItem) {setState(() {debugPrint("User Select $selectedItem");});},
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: studentName,
                    style: textStyle,
                    onChanged: (value) { debugPrint("User Edit the Name");},
                    decoration: InputDecoration(
                        labelText: "Name :",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: studentDetails,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint("User Edit the Description");
                      },

                    decoration: InputDecoration(
                        labelText: "Description :",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row (
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'SAVE', textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("User Click SAVED");
                            });
                          },
                        ),

                      ),

                    // to separate buttons
                      Container(width: 5.0,),

                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete', textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("User Click Delete");
                            });
                          },
                        ),

                      ),
                    ],


                  ),
                )


              ],
            ),
          ),

          ),
     );
  }

  void goBack() {Navigator.pop(context);}
}
