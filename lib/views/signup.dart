//import 'dart:js';

import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/chatroom.dart';
import 'package:chatapp/widgets/widget.dart';
//import 'package:chatapp/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpState extends StatefulWidget {
  final Function toggle;
  SignUpState(this.toggle);
  @override
  _SignUpStateState createState() => _SignUpStateState();
}

class _SignUpStateState extends State<SignUpState> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "name" : userNameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
//        print("${val.uId}");



databaseMethods.uploadUserInfo( userInfoMap);

        Navigator.pushReplacement(context ,MaterialPageRoute(
          builder:(context) => ChatRoom()
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              )),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 24,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(

                          child: Image(
                            image: AssetImage('assets/images/2992779.jpg'),
                          )),
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                validator: (val) {
                                  return val.isEmpty || val.length < 5
                                      ? "please provide a valid Username"
                                      : null;
                                },
                                controller: userNameTextEditingController,
                                style: simpleTextStyle(),
                                decoration:
                                    textFieldInputDecoration("Username")),
                            TextFormField(
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA_Z0-9.a-zA-Z0-9.!#$&'*+-/=?^_`{|}~]+@[a-zA_Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "please prvoide a valid email ID";
                                },
                                controller: emailTextEditingController,
                                style: simpleTextStyle(),
                                decoration: textFieldInputDecoration("Email")),
                            TextFormField(
                                obscureText: true,
                                validator: (val) {
                                  return val.length > 6
                                      ? null
                                      : "please proovide 6+ password";
                                },
                                controller: passwordTextEditingController,
                                style: simpleTextStyle(),
                                decoration:
                                    textFieldInputDecoration("Password")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          signMeUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 48,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text("Sign Up", style: MediumTextStyle()),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text("SignUp with Google",
                            style: MediumTextStyle()),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          (Text(
                            "Already have acounnt? ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          )),
                          GestureDetector(
                            onTap: (){
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: (Text(
                                "Signin ",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
