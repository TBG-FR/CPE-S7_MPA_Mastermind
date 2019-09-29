
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/combination.widget.dart';
import 'package:flutter_app/widgets/tries.widget.dart';
import '../model/mastermind.dart';

class MastermindGame extends StatefulWidget {

  final Mastermind mastermind;// = new Mastermind();

  MastermindGame({Key key, @required this.mastermind}) : super(key: key);

  @override
  _MastermindGameState createState() => _MastermindGameState();
}

class _MastermindGameState extends State<MastermindGame> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind'),
//        actions: <Widget>
//        [
//          IconButton
//            (
//            icon: Icon(Icons.list),
//            onPressed: _pushSaved,
//          ),
//        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: CombinationWidget(combination: widget.mastermind.secretCode),),
          Expanded(child: TriesWidget(mastermind: widget.mastermind),),
        ],
      ),
    );
  }
}