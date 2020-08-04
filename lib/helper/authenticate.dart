import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/signin.dart';
import 'package:flutter_firebase/views/signup.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignin = true;
  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignin) {
      return Signin(toggleView);
    } else {
      return SignUp(toggleView);
    }
  }
}
