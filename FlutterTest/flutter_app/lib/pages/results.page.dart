
import 'package:flutter/material.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/model/results.model.dart';
import 'package:flutter_app/utils/enums.utils.dart';
import 'package:intl/intl.dart';

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
      body: Container(
        alignment: Alignment.topCenter,
        //padding: EdgeInsets.all(2.5),
        child: Table(
          columnWidths:
          {
            0: FlexColumnWidth(150.0),
            1: FlexColumnWidth(75.0),
            2: FlexColumnWidth(100.0),
          },
          children: _buildTableRows(widget.results),
      ),)
    );
  }

  List<TableRow> _buildTableRows(ResultsModel resultsModel)
  {
    List<TableRow> list = new List<TableRow>();    
    
    for(ResultModel resultModel in resultsModel.results)
      {
        list.add(_buildTableRow(resultModel));
      }
    
    return list.reversed.toList();
  }

  TableRow _buildTableRow(ResultModel resultModel)
  {

    Color col;
    switch(resultModel.gameResult)
    {
      case ResultEnum.won:
        col = Colors.green;
        break;
      case ResultEnum.lost:
        col = Colors.red;
        break;
      case ResultEnum.aborted:
      default:
        col = Colors.orange;
        break;
    }

    return TableRow(

      decoration: new BoxDecoration(color: col),
      children: [
        TableCell(child: Text(new DateFormat("dd-MM-yyyy - mm:ss").format(resultModel.dateTime), style: TextStyle(fontWeight: FontWeight.bold))),
        TableCell(child: Text(EnumToString.parse(resultModel.gameResult).toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold))),
        TableCell(child: Text(resultModel.numberOfTries.toString() + (resultModel.numberOfTries > 1 ? " tries" : " try"), style: TextStyle(fontWeight: FontWeight.bold))),
      ]
    );
  }

}