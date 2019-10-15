
import 'package:flutter/material.dart';
import 'package:flutter_app/model/mastermind.dart';
import 'try.widget.dart';

class TriesWidget extends StatefulWidget {

  final Mastermind mastermind;

  TriesWidget({Key key, @required this.mastermind}) : super(key: key);

  @override
  _TriesWidgetState createState() => _TriesWidgetState();
}

class _TriesWidgetState extends State<TriesWidget> {

//  void _handleButtonPressed(bool newValue) {
//    setState(() {
//      widget.mastermind.checkLastTry();
//    });
//  }

  /*

  // SINGLE ITEM

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TryWidget(
          tryModel: widget.mastermind.tries.last,
          onChanged: _handleButtonPressed
      ),
    );
  }

*/



  // MULTIPLE ITEMS

/**/
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: ListView.builder(
          itemCount: widget.mastermind.tries.length,
          shrinkWrap: true,
 //         padding: const EdgeInsets.all(1.0),
          itemBuilder: (BuildContext context, int index) {
            return new TryWidget(
                tryModel: widget.mastermind.tries.elementAt(index),
            );
          }
      ),
    );
  }
/**/


/*
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: TryWidget(
              tryModel: widget.mastermind.tries[0],
              onChanged: _handleButtonPressed
          ),
        ),
        Expanded(
          child: TryWidget(
              tryModel: widget.mastermind.tries[1],
              onChanged: _handleButtonPressed
          ),
        ),
        Expanded(
          child: TryWidget(
              tryModel: widget.mastermind.tries[2],
              onChanged: _handleButtonPressed
          ),
        ),
      ],
    );
  }
*/


}