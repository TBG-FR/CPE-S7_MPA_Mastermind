
import 'package:flutter/material.dart';
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
        padding: EdgeInsets.all(50),
        child: Table(
          columnWidths:
          {
            0: FixedColumnWidth(150.0),
            1: FixedColumnWidth(50.0),
            2: FixedColumnWidth(100.0),
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
    
    return list;
  }

  TableRow _buildTableRow(ResultModel resultModel)
  {
    return TableRow(
      children: [
        TableCell(child: Text(new DateFormat("dd-MM-yyyy - mm:ss").format(resultModel.dateTime)),),
        TableCell(child: Text(EnumToString.parse(resultModel.gameResult).toUpperCase()),),
        TableCell(child: Text(resultModel.numberOfTries.toString() + (resultModel.numberOfTries > 1 ? " tries" : " try")),),
      ]
    );
  }

}