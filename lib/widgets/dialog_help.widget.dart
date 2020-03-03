import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/enums/peg-key-type.enum.dart';
import 'package:flutter_app/model/enums/peg-key-type.enum.dart';
import 'package:flutter_app/model/peg-key.model.dart';

class DialogHelpWidget {

  static const String labelTitle = "title";
  static const String labelText1 = "text1";
  static const String labelText2 = "text2";
  static const String labelText3 = "text3";
  static const String labelText4 = "text4";
  static const String labelText5 = "text5";
  static const String labelText6 = "text6";
  static const String labelCancel = "cancel";


static void displayFull(BuildContext context, Map<String, String> labels)
  {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(labels[DialogHelpWidget.labelTitle]),
            content: Column (children: <Widget>[
              Icon(Icons.check_circle),
              Text(labels[DialogHelpWidget.labelText1]),
              Icon(Icons.fiber_manual_record, color : KeyPegModel(KeyPegTypeEnum.WRONG_POSITION).color),
              Text(labels[DialogHelpWidget.labelText2]),
              Icon(Icons.fiber_manual_record, color : KeyPegModel(KeyPegTypeEnum.WELL_PLACED).color),
              Text(labels[DialogHelpWidget.labelText3]),
              Icon(Icons.fiber_manual_record,color : KeyPegModel(KeyPegTypeEnum.WRONG_PEG).color),
              Text(labels[DialogHelpWidget.labelText4]),
              Icon(Icons.refresh),
              Text(labels[DialogHelpWidget.labelText5]),
              Icon(Icons.cancel),
              Text(labels[DialogHelpWidget.labelText6]),
            ],),
            actions: <Widget>[
              FlatButton
              (
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(labels[DialogHelpWidget.labelCancel])
              ),
            ],
          );
        }
    );
  }
}