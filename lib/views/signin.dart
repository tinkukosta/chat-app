import 'package:chatapp/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 16,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
              child:Image(
                image: AssetImage('assets/images/2992779.jpg'),
                  )
                  
                ),
                TextField(
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Email")),
                SizedBox(
                  height: 8,
                ),
                TextField(
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Password")),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.teal, borderRadius: BorderRadius.circular(30)),
                  child: Text("Login", style: MediumTextStyle()),
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
                      color: Colors.teal, borderRadius: BorderRadius.circular(30)),
                  child: Text("Sign in with Google", style: MediumTextStyle()),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (Text("don't have acounnt? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    ),)),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: (Text("Register now ",
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
                  height: 16,
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
