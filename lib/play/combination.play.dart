
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menu.launch.dart';
import 'package:flutter_app/widgets/dialog_abort.widget.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/pages/result.page.dart';
import 'package:flutter_app/widgets/combination.widget.dart';
import '../model/mastermind.model.dart';
import 'tries.play.dart';

class CombinationPlay extends StatefulWidget
{
  final MastermindModel mastermind;// = new Mastermind();

  CombinationPlay({Key key, @required this.mastermind}) : super(key: key);

  @override
  _CombinationPlayState createState() => _CombinationPlayState();
}

class _CombinationPlayState extends State<CombinationPlay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play - Player 1'),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>
        [
          //Text('Player 1', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          Text('Define the secret combination !', style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
          Expanded(child: CombinationWidget(combination: widget.mastermind.secretCode, pegSize: 45,)),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: () {  setState (() { _cancelGameAction(); }); },
              backgroundColor: Colors.white,
              child: Icon(Icons.stop, color: Colors.red, size: 50,),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {  setState (() { widget.mastermind.resetGame(); }); },
              backgroundColor: Colors.white,
              child: Icon(Icons.autorenew, color: Colors.blue, size: 50,),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () { _launchGame(widget.mastermind); },
              backgroundColor: Colors.white,
              child: Icon(Icons.play_circle_filled, color: Colors.green, size: 50,),
            ),
          ],
        ),
    );
  }

//  void _checkLastTryAndGameStatus() {
//
//    ResultModel gameResult;
//
//    setState(() { gameResult = widget.mastermind.checkLastTry(); });
//
//    if(gameResult != null)
//    {
//      Navigator.of(context).push(new MaterialPageRoute(
//          builder: (BuildContext context) => new ResultPage(result: gameResult)));
//    }
//
//  }
//
//  void _cancelGameDialog()
//  {
//
//    DialogWidget.displayFull(context,
//      new Map.fromEntries
//        (
//            [
//              new MapEntry(DialogWidget.labelTitle, "Abandonner"),
//              new MapEntry(DialogWidget.labelText, "Voulez-vous vraiment abandonner ?"),
//              new MapEntry(DialogWidget.labelYes, "Oui, c'est trop dur !"),
//              new MapEntry(DialogWidget.labelCancel, "Non, je vais gagner !"),
//            ]
//        ),
//        _cancelGameAction);
//  }
//
//  void _cancelGameAction(bool userResponse) {
//
//    Navigator.pop(context); // close dialog
//
//    if (userResponse == true)
//    {
//      Navigator.of(context).push(new MaterialPageRoute(
//          builder: (BuildContext context) => new ResultPage(result: widget.mastermind.endGame(ResultEnum.aborted))));
//    }
//  }

  void _launchGame(MastermindModel mastermind)
  {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new TriesPlay(mastermind: mastermind,)));
  }

  void _cancelGameAction()
  {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LaunchMenu()));
  }

}