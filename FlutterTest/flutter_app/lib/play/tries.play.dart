
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/dialog.widget.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/pages/result.page.dart';
import 'package:flutter_app/widgets/tries.widget.dart';
import '../model/mastermind.model.dart';

class TriesPlay extends StatefulWidget
{
  final MastermindModel mastermind;// = new Mastermind();

  TriesPlay({Key key, @required this.mastermind}) : super(key: key);

  @override
  _TriesPlayState createState() => _TriesPlayState();
}

class _TriesPlayState extends State<TriesPlay> {

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
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('Player 2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          Text('Try to find the combination !', style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
          Padding(padding: EdgeInsets.only(bottom: 25.0)),
          Expanded(child: TriesWidget(mastermind: widget.mastermind),),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: () {  setState (() { _cancelGameDialog(); }); },
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

    ResultModel gameResult;

    setState(() { gameResult = widget.mastermind.checkLastTry(); });

    if(gameResult != null)
    {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new ResultPage(result: gameResult)));
    }

  }

  void _cancelGameDialog()
  {

    DialogWidget.displayFull(context,
      new Map.fromEntries
        (
            [
              new MapEntry(DialogWidget.labelTitle, "Abandonner"),
              new MapEntry(DialogWidget.labelText, "Voulez-vous vraiment abandonner ?"),
              new MapEntry(DialogWidget.labelYes, "Oui :("),
              new MapEntry(DialogWidget.labelCancel, "Non, je vais gagner !"),
            ]
        ),
        _cancelGameAction);
  }

  void _cancelGameAction(bool userResponse) {

    Navigator.pop(context); // close dialog

    if (userResponse == true)
    {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new ResultPage(result: widget.mastermind.endGame(ResultEnum.aborted))));
    }
  }
}