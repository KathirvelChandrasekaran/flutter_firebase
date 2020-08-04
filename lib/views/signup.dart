import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:flutter_firebase/views/chatRoom.dart';
import 'package:flutter_firebase/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  final Function toggle;

  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethod databaseMethod = new DatabaseMethod();

  TextEditingController userName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  signUp() {
    Map<String, String> userInfoMap = {
      "name": userName.text,
      "email": email.text
    };

    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods.signUpWithEmail(email.text, password.text).then((value) {
        databaseMethod.postUserInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 4
                                    ? 'Provide Username'
                                    : null;
                              },
                              controller: userName,
                              style: textFieldInputColor(),
                              decoration: textFieldInputDecoration("Username"),
                            ),
                            TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Provide valid email";
                              },
                              controller: email,
                              style: textFieldInputColor(),
                              decoration: textFieldInputDecoration("Email"),
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.isEmpty || val.length < 6
                                    ? 'Provide Password'
                                    : null;
                              },
                              controller: password,
                              style: textFieldInputColor(),
                              decoration: textFieldInputDecoration('Password'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Forgot Password',
                            style: textFieldInputColor(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                              ]),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text('Sign Up', style: largeText()),
                        ),
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
                        child: Text('Sign up using Google',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already an account ?",
                            style: largeText(),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                " Sign in now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
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
