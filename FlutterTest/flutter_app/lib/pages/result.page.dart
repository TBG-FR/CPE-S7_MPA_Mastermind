
import 'package:flutter/material.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/widgets/combination.widget.dart';

class ResultPage extends StatefulWidget {

  final ResultModel result;

  ResultPage({Key key, @required this.result}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind - Result'),
//        actions: <Widget>
      // TODO : Action "go to resultS page"
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
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 100.0)),
          _textFromResultEnum(widget.result.gameResult),
          _textFromTries(widget.result.numberOfTries),
          Padding(padding: EdgeInsets.only(top: 100.0)),
          _textFromCombination(),
          Expanded(child: CombinationWidget(combination: widget.result.secretCode),),
        ],
      ),
//      floatingActionButton:
    // TODO : Action button "share my result"
//      Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          FloatingActionButton(
//            heroTag: null,
//            onPressed: () { /* CANCEL (GO BACK) */ },
//            backgroundColor: Colors.white,
//            child: Icon(Icons.cancel, color: Colors.red, size: 50,),
//          ),
//          FloatingActionButton(
//            heroTag: null,
//            onPressed: () { /* RETRY ? */ },
//            backgroundColor: Colors.white,
//            child: Icon(Icons.refresh, color: Colors.blue, size: 50,),
//          ),
//          FloatingActionButton(
//            heroTag: null,
//            onPressed: () { setState(() { widget.mastermind.checkLastTry(); }); },
//            backgroundColor: Colors.white,
//            child: Icon(Icons.check_circle, color: Colors.green, size: 50,),
//          ),
//        ],
//      ),
    );
  }

  Text _textFromCombination()
  {
    return new Text("The combination was the following :",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
      ),);
  }

  Text _textFromTries(int tries)
  {
    
    // TODO : Put "It took you" X tries or "You played" X tries depending on the result

    return new Text("You played $tries tries",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),);
  }

  Text _textFromResultEnum(ResultEnum result)
  {
    String resultText = "";
    Color resultColor = Colors.black;

    switch(result) {

      case ResultEnum.won:
        resultText = "You won !";
        resultColor = Colors.green;
        break;

      case ResultEnum.lost:
        resultText = "You lose...";
        resultColor = Colors.red;
        break;

      case ResultEnum.aborted:
      default:
      resultText = "Game was aborted.";
      resultColor = Colors.orange;
        break;
    }

    return new Text(resultText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: resultColor,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),);

  }

}