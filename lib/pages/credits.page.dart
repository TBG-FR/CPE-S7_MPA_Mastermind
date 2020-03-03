
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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text("Mastermind Reloaded \n Gestion de Projet Agile \n CPE Lyon - 4IRC (S7) \n\n\n Developed by (Name & Github) :  \n\n Julien M. (@jmoorat) \n Jeremy M. (@JeremyCPE) \n Robin D. (@RobinDeville) \n Tom-Brian G. (@TBG-FR) \n"),
      ),
    );
  }

}