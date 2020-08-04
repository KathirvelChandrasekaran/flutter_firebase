import 'package:flutter/material.dart';
import 'package:flutter_firebase/helper/authenticate.dart';

void main() {
      runApp(MyApp());
}

class MyApp extends StatelessWidget {
      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
            return MaterialApp(
                  title: 'ChatBox',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                        primaryColor: Color(0xff145C9E),
                        scaffoldBackgroundColor: Color(0xff1F1F1F),
                        accentColor: Color(0xff007EF4),
                        fontFamily: "OverpassRegular",
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  home: Authenticate(),
            );
      }
}