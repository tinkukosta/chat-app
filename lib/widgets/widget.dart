import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
    title: Text('ChatApp',
    style: TextStyle(
        fontSize: 16,
    ),
  ),
    backgroundColor: Colors.teal,
  );

}

InputDecoration textFieldInputDecoration(String hintText){
 return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
        ),
    ),

  );

}

TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.teal
  );
}

TextStyle searcheTextStyle(){
  return TextStyle(
      color: Colors.white
  );
}
// ignore: non_constant_identifier_names
TextStyle MediumTextStyle(){
  return TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );
}