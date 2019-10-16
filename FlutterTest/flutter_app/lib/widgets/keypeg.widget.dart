
import 'package:flutter/material.dart';
import 'package:flutter_app/model/peg.dart';

class KeyPegItem extends StatelessWidget {
//Apparence des pieces d'incides visibles par les joueurs
  final Peg pegModel;

  KeyPegItem({Key key, @required this.pegModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 15,
      height: 15,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: pegModel.color,
      ),
    );
  }
}