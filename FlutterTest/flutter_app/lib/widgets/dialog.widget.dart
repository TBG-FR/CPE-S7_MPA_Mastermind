import 'package:flutter/material.dart';

class DialogWidget {

  static const String labelTitle = "title";
  static const String labelText = "title";
  static const String labelYes = "yes";
  static const String labelCancel = "cancel";

  static display(BuildContext context, String title, String description, Function handleConfirmation){
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
                onPressed: () => handleConfirmation(false),
                child: Text("NON !")
              ),
              FlatButton(
                  onPressed: () => handleConfirmation(true),
                  child: Text("Oui, je suis nul")
              )
          ],
        );
      }
    );
  }

  static void displayFull(BuildContext context, Map<String, String> labels, Function handleConfirmation)
  {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(labels[DialogWidget.labelTitle]),
            content: Text(labels[DialogWidget.labelText]),
            actions: <Widget>[
              FlatButton
              (
                  onPressed: () => handleConfirmation(false),
                  child: Text(labels[DialogWidget.labelCancel])
              ),
              FlatButton
              (
                  onPressed: () => handleConfirmation(true),
                  child: Text(labels[DialogWidget.labelYes])
              ),
            ],
          );
        }
    );
  }
}