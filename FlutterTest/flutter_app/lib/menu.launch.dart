
import 'package:flutter/material.dart';
import 'model/mastermind.model.dart';
import 'model/switch.model.dart';
import 'play/combination.play.dart';
import 'play/tries.play.dart';
import 'utils/settings.utils.dart';

class LaunchMenu extends StatefulWidget {
  @override
  LaunchMenuState createState() => LaunchMenuState();
}

class LaunchMenuState extends State<LaunchMenu> {

  //static SwitchModel playersSwitch = new SwitchModel(const Icon(Icons.people), const Text('2 Players'), const Icon(Icons.computer), const Text('Computer'));
  static SwitchModel playersSwitch = new SwitchModel(const Icon(Icons.people), const Text('2P'), const Icon(Icons.computer), const Text('1P'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configuration du Jeu'),
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
                    Text("Game mode"),
                    SwitchListTile(
                      title: playersSwitch.currentText,
                      value: playersSwitch.currentValue,
                      onChanged: (bool value) { setState(() { playersSwitch.doSwitch(value); }); },
                      secondary: playersSwitch.currentIcon,
                    ),
//                    RaisedButton(
//                      onPressed: () { /* TODO */ },
//                      child: Text("Multi"),
//                    ),
                    Text("Code length : " + Settings.codeLength.toString()),
                    Slider
                    (
                      min: Settings.codeLengthMin.toDouble(),
                      max: Settings.codeLengthMax.toDouble(),
                      value: Settings.codeLength.toDouble(),
                      onChanged: (double value) { setState(() { Settings.codeLength = value.toInt(); }); },
                    ),
                    Text("Allowed tries : " + Settings.triesAllowed.toString()),
                    Slider
                    (
                      min: 1,
                      max: 25,
                      value: Settings.triesAllowed.toDouble(),
                      onChanged: (double value) { setState(() { Settings.triesAllowed = value.toInt(); }); },
                    ),
                    RaisedButton(
                      onPressed: () { playGame(); },
                      child: Text("Start"),
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

    MastermindModel mastermind = new MastermindModel();
    // TODO : Add difficulty and gamemode in constructor/here
    mastermind.newTry();

    if(playersSwitch.currentValue == true)
    {
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CombinationPlay(mastermind: mastermind,)));
    }
    else
    {
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new TriesPlay(mastermind: mastermind,)));
    }

    //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MastermindPage(mastermind: mastermind,)));
  }

  void seeResults() {

  }

  void seeCredits() {

  }

}

