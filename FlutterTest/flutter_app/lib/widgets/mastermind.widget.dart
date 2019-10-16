
import 'package:flutter/material.dart';
import 'package:flutter_app/model/dialog.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/pages/result.page.dart';
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
//          IconButton(
//            icon: Icon(Icons.check_circle),
//            color: Colors.green,
//            iconSize: 45,
//            onPressed: () => widget.mastermind.checkLastTry(),
//          ),
//          IconButton(
//            icon: Icon(Icons.cancel),
//            color: Colors.red,
//            iconSize: 45,
//            //onPressed: () => widget.mastermind = new Mastermind(),
//          ),
//        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: CombinationWidget(combination: widget.mastermind.secretCode),),
          Expanded(child: TriesWidget(mastermind: widget.mastermind),),

        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: () {  setState (() { _cancelGame(); }); },
              backgroundColor: Colors.white,
              child: Icon(Icons.cancel, color: Colors.red, size: 50,),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {  setState (() { widget.mastermind.resetGame(); }); },
              backgroundColor: Colors.white,
              child: Icon(Icons.refresh, color: Colors.blue, size: 50,),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () { _checkLastTryAndGameStatus(); },
              backgroundColor: Colors.white,
              child: Icon(Icons.check_circle, color: Colors.green, size: 50,),
            ),
          ],
        ),
    );
  }

  void _checkLastTryAndGameStatus() {

    Result gameResult;

    setState(() { gameResult = widget.mastermind.checkLastTry(); });

    if(gameResult != null)
    {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new ResultPage(result: gameResult)));
    }

  }

  void _cancelGame()
  {
    InformationDialog.display(context, "Bah alors, on est nul ?", "Tu souhaites vraiment abandonner ?", widget.mastermind);

//    InformationDialog.display(context,
//        "T'es Nul ?",
//        "Tu souhaites vraiment abandonner ?!?",
//            () => (bool isYes, BuildContext context)
//        {
//
//        }
//        );
  }

//  void cancelGameCode(bool isYes, BuildContext context)
//  {
//    if (isYes){
//    Navigator.of(context).push(new MaterialPageRoute(
//        builder: (BuildContext context) => new ResultPage(result: widget.mastermind.endGame(ResultEnum.aborted))));
//
//  }
//  }

}