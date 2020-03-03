// Mastermind

import 'package:flutter/material.dart';
import 'menu.home.dart';

void main() => runApp(MastermindApp());

class MastermindApp extends StatelessWidget {

//  static const String ROUTE_HOME = "/";
//  static const String ROUTE_LAUNCH = "/launch";

  @override
  Widget build(BuildContext context) {
        return MaterialApp(

//          initialRoute: ROUTE_HOME,
//          routes: {
//            ROUTE_HOME: (context) => HomeMenu(),
//            ROUTE_LAUNCH: (context) => LaunchMenu(),
//          },
          home: HomeMenu(),

          title: 'Mastermind Reloaded',

          theme: ThemeData(
            primaryColor: Colors.lightBlue,
            dividerColor: Colors.deepPurpleAccent,

      ),
    );
  }
}