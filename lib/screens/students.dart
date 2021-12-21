//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_sqlight/screens/student_details.dart';

class StudentsList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentsState();
  }
}

class StudentsState extends State<StudentsList>{
  int count =0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: Text("students"),
        ),
        body: getStudentsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {navigateToStudent("Add New Student"); },
/*           // to go to student page using onTap or onPressed
            // so that we create new function navigateToStudent as bellow

            Navigator.push(context,MaterialPageRoute(builder: (context) {
              return StudentDetails();
            }));
*/
          tooltip: 'Add Student',
          child: Icon(Icons.add),
        )
    );
  }

  ListView getStudentsList(){
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext cotext,int position){
          return Card(
            color:Colors.white ,
            elevation:2.0 ,
            child:ListTile(
              leading:CircleAvatar(
                backgroundColor:Colors.amber,
                child:Icon(Icons.check),
              ),
              title: Text("The first student"),
              subtitle: Text("The data form of this Student"),
              trailing: Icon(Icons.delete, color: Colors.grey,),
              onTap: (){
                navigateToStudent("Edit Student");},
            ),
          );
          }
    );
  }
  void navigateToStudent(String appTitle){
    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return StudentDetails(appTitle);
    })
    );
  }
}
