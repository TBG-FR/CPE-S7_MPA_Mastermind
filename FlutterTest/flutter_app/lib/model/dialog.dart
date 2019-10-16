import 'package:flutter/material.dart';


class Dialogue  {


  _confirmResult(bool isYes, BuildContext context){

    if (isYes){
      /* TODO : methode abandon */
    }

  }

  confirmDialog(BuildContext context, String title, String description){
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
                onPressed: () => _confirmResult(false,context),
                child: Text("NON !")
              ),
              FlatButton(
                  onPressed: () =>_confirmResult(true,context),
                  child: Text("Oui, je suis nul")
              )
          ],
        );
      }
    );
  }



}