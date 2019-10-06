
import 'package:flutter/material.dart';
import 'package:flutter_app/model/combination.dart';
import 'package:flutter_app/model/mastermind.dart';
import 'package:flutter_app/model/peg.dart';
import 'package:flutter_app/model/settings.dart';
import 'package:flutter_app/widgets/peg.widget.dart';
import 'package:scoped_model/scoped_model.dart';


import 'mastermind.widget.dart';

class HintWidget extends StatelessWidget {

  final int row;

//Apparence des indices
  // final Peg pegModel;


  HintWidget({Key key, this.row}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 50,
      height: 50,
      child: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, Model model) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //TODO : Create class extends Model
                    //TODO : Adapt for > 4 hints
                    /*
                    hintPeg(appState.hints[row][0]),
                    hintPeg(appState.hints[row][1]),
                    hintPeg(appState.hints[row][2]),
                    hintPeg(appState.hints[row][3]),

                     */
                  ]),
            ],
          );
        },
      ),
    );
  }

  hintPeg(color) {
    return SizedBox(height: 25, width: 25, child: PegItem(pegModel: color));
  }


}


