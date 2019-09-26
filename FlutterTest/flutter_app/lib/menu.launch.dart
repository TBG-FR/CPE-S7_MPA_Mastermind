
import 'package:flutter/material.dart';
import 'main.dart';
import 'play.game.dart';

class LaunchMenu extends StatefulWidget {
  @override
  LaunchMenuState createState() => LaunchMenuState();
}

class LaunchMenuState extends State<LaunchMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text('Startup Name Gen\''),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Mastermind",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () { playGame(); },
                      child: Text("Solo"),
                    ),
                    RaisedButton(
                      onPressed: () { /* TODO */ },
                      child: Text("Multi"),
                    ),
                    RaisedButton(
                      onPressed: () { /* TODO */ },
                      child: Text("TODO"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  void playGame() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MastermindGame()));
  }

  void seeResults() {

  }

  void seeCredits() {

  }

}

