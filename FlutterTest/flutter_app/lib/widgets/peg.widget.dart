
import 'package:flutter/material.dart';
import 'package:flutter_app/model/peg.dart';

class PegItem extends StatelessWidget {
//Apparence des pieces visibles par le joueur.
  final Peg pegModel;

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