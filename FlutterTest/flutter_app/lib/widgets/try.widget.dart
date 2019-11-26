
import 'package:flutter/material.dart';
import 'package:flutter_app/model/try.model.dart';
import 'package:flutter_app/widgets/combination.widget.dart';

import 'hints.widget.dart';

class TryWidget extends StatelessWidget {

  TryWidget({Key key, @required this.tryModel/*, @required this.onChanged*/}) : super(key: key);

//  final ValueChanged<bool> onChanged;
  final TryModel tryModel;

//  void _handlePressed() {
//    onChanged(true);
//  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 35,
          child: CombinationWidget(combination: tryModel.tryCode, pegSize: 30,),
        ),
        Container(
          height: 25,
          child: HintsWidget(result: tryModel.result),
        ),
        Padding(padding: EdgeInsets.only(bottom: 25.0)),
        /*
        Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  height: 65,
                  child: CombinationWidget(combination: tryModel.tryCode, pegSize: 30,),
                )
              ],
            )
        ),
        Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  height: 65,
                  child: HintsWidget(result: tryModel.result),
                )
              ],
            )
        ),
        */
      ],
    );
  }
}