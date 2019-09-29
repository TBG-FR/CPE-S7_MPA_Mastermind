
import 'package:flutter/material.dart';
import 'package:flutter_app/model/peg.dart';

class PegItem extends StatelessWidget {

  final Peg peg;

  PegItem(this.peg);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: peg.color,
      ),
    );
  }
}