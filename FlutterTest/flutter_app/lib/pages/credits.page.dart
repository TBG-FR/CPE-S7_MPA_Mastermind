
import 'package:flutter/material.dart';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter_app/widgets/combination.widget.dart';

class CreditsPage extends StatefulWidget
{
  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>
        [
          Text("Mastermind Reloaded"),
          Text('"Gestion de Projet Agile"'),
          Text('CPE Lyon - 4IRC (S7)'),
          Text('Developed by (Name & Github) : '),
          Text('Julien M. (@jmoorat)'),
          Text('Jeremy M. (@JeremyCPE)'),
          Text('Robin D. (@RobinDeville)'),
          Text('Tom-Brian G. (@TBG-FR)'),
        ],
      ),
    );
  }

}