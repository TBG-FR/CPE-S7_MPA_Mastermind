import 'package:flutter/material.dart';

class DialogAbortWidget {

  static const String labelTitle = "title";
  static const String labelText = "title";
  static const String labelYes = "yes";
  static const String labelCancel = "cancel";

  static void displayFull(BuildContext context, Map<String, String> labels, Function handleConfirmation)
  {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(labels[DialogAbortWidget.labelTitle]),
            content: Text(labels[DialogAbortWidget.labelText]),
            actions: <Widget>[
              FlatButton
              (
                  onPressed: () => handleConfirmation(false),
                  child: Text(labels[DialogAbortWidget.labelCancel])
              ),
              FlatButton
              (
                  onPressed: () => handleConfirmation(true),
                  child: Text(labels[DialogAbortWidget.labelYes])
              ),
            ],
          );
        }
    );
  }
}