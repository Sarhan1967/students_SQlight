import 'package:flutter/material.dart';
import 'package:students_sqlight/screens/students.dart';
//import 'package:students_sqlight/screens/student_details.dart';
//import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primarySwatch: Colors.cyan
      ),
      home: StudentsList(),
    );
  }
}