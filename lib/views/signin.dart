import 'package:flutter/material.dart';
import 'package:flutter_firebase/widgets/widgets.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  style: textFieldInputColor(),
                  decoration: textFieldInputDecoration("Email"),
                ),
                TextField(
                  style: textFieldInputColor(),
                  decoration: textFieldInputDecoration('Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Forgot Password',
                      style: textFieldInputColor(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC)
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('Sign In', style: largeText()),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xffffffff),
                        const Color(0xffffffff)
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('Sign In using Google',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account ?",
                      style: largeText(),
                    ),
                    Text(
                      " Register now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle textFieldInputColor() {
  return TextStyle(color: Colors.white);
}

TextStyle largeText() {
  return TextStyle(color: Colors.white, fontSize: 20);
}
