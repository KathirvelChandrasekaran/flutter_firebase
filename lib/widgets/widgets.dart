import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text('Chatbox'),
    backgroundColor: Colors.black54,
    centerTitle: true,
    elevation: 0,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return (InputDecoration(
      hintText: hintText,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      hintStyle: TextStyle(color: Colors.white54))
  );
}
