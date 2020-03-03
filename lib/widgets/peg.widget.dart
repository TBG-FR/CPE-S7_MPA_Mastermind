
import 'package:flutter/material.dart';
import 'package:flutter_app/model/peg.model.dart';
import 'package:flutter_app/utils/settings.utils.dart';

class PegItem extends StatelessWidget {
//Apparence des pieces visibles par le joueur.
  final PegModel pegModel;
  double pegSize = Settings.defaultSize;

  PegItem({Key key, @required this.pegModel, this.pegSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: pegSize,
      height: pegSize,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: pegModel.color,
      ),
    );
  }
}