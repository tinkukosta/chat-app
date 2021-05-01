//import 'package:chatapp/views/signin.dart';
import 'package:chatapp/helper/authenticate.dart';
//import 'package:chatapp/views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      scaffoldBackgroundColor: Colors.white,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Authenticate()
    );
  }
}
//
//return RegExp(
//r"^[a-zA_Z0-9,a-zA-Z0-9,!#$&'*+-/=?^_`{|}~]+@[a-zA_Z0-9]+\,[a-zA-Z]+")
//.hasMatch(val) ? null: "please prvoide a valid email ID";
