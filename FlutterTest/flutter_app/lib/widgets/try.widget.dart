
import 'package:flutter/material.dart';
import 'package:flutter_app/model/try.dart';
import 'package:flutter_app/widgets/combination.widget.dart';

class TryWidget extends StatelessWidget {

  TryWidget({Key key, @required this.tryModel/*, @required this.onChanged*/}) : super(key: key);

//  final ValueChanged<bool> onChanged;
  final Try tryModel;

//  void _handlePressed() {
//    onChanged(true);
//  }

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  height: 65,
                  child: CombinationWidget(combination: tryModel.tryCode),
                )
              ],
            )
        ),
//        IconButton(
//          iconSize: 50,
//          onPressed: _handlePressed,
//          icon: Icon(Icons.check_circle, color: Colors.yellow,),
//        ),
      ],
    );
  }
}