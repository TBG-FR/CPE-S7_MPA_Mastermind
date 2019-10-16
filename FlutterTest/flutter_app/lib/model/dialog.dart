import 'package:flutter/material.dart';
import 'package:flutter_app/model/mastermind.dart';
import 'package:flutter_app/pages/result.page.dart';

import 'enums/result.enum.dart';


class InformationDialog {


  static _confirmResult(bool isYes, BuildContext context, Mastermind mastermind){

    if (isYes){
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new ResultPage(result: mastermind.endGame(ResultEnum.aborted))));
    }

  }

  static display(BuildContext context, String title, String description, Mastermind mastermind){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description)
              ],
            )
          ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => _confirmResult(false, context, mastermind),
                child: Text("NON !")
              ),
              FlatButton(
                  onPressed: () =>_confirmResult(true, context, mastermind),
                  child: Text("Oui, je suis nul")
              )
          ],
        );
      }
    );
  }



}