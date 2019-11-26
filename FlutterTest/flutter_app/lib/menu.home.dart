
import 'package:flutter/material.dart';
import 'menu.launch.dart';

class HomeMenu extends StatefulWidget {
  @override
  HomeMenuState createState() => HomeMenuState();
}

class HomeMenuState extends State<HomeMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mastermind'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
//              Text(
//                "Mastermind",
//                style: TextStyle(
//                  fontSize: 18.0,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
              IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () { launchGame(); },
                      child: Text("Jouer"),
                    ),
                    RaisedButton(
                      onPressed: () { seeResults(); },
                      child: Text("Scores"),
                    ),
                    RaisedButton(
                      onPressed: () { seeCredits(); },
                      child: Text("Crédits"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  void launchGame() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LaunchMenu()));
  }

  void seeResults() {

  }

  void seeCredits() {

  }

}