
import 'package:flutter/material.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/model/results.model.dart';
import 'package:flutter_app/widgets/combination.widget.dart';

class ResultsPage extends StatefulWidget {

  final ResultsModel results;

  ResultsPage({Key key, @required this.results}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind - Result'),

//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.check_circle),
//            color: Colors.green,
//            iconSize: 45,
//            //onPressed: () => widget.mastermind.checkLastTry(),
//          ),
//          IconButton(
//            icon: Icon(Icons.check_circle),
//            color: Colors.green,
//            iconSize: 45,
//            //onPressed: () => widget.mastermind.checkLastTry(),
//          ),
//        ],
      ),
      body:
//      Column(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>
//        [
        ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widget.results.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(child: Text('Game ${widget.results.results[index].gameResult.toString()} at ${widget.results.results[index].dateTime.toString()}')),
            );
          }),
//          //ListView.builder(itemBuilder: )
////          Padding(padding: EdgeInsets.only(top: 100.0)),
////          _textFromResultEnum(widget.result.gameResult),
////          _textFromTries(widget.result.numberOfTries),
////          Padding(padding: EdgeInsets.only(top: 100.0)),
////          _textFromCombination(),
////          Expanded(child: CombinationWidget(combination: widget.result.secretCode, pegSize: 35,),),
//        ],
//      ),
    );
  }

}