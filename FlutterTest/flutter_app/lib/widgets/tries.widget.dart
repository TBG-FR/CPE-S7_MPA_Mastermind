
import 'package:flutter/material.dart';
import 'package:flutter_app/model/mastermind.model.dart';
import 'try.widget.dart';

class TriesWidget extends StatefulWidget {

  final MastermindModel mastermind;

  TriesWidget({Key key, @required this.mastermind}) : super(key: key);

  @override
  _TriesWidgetState createState() => _TriesWidgetState();
}

class _TriesWidgetState extends State<TriesWidget>
{

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

}