
import 'package:flutter/material.dart';
import 'package:flutter_app/model/peg.model.dart';

class PegItem extends StatelessWidget {
//Apparence des pieces visibles par le joueur.
  final PegModel pegModel;

  PegItem({Key key, @required this.pegModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: pegModel.color,
      ),
    );
  }
}