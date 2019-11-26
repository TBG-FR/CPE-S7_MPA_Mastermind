
import 'package:flutter/material.dart';

class SwitchModel {

  bool currentValue;

  Icon    currentIcon;
  Icon    trueIcon;
  Icon    falseIcon;

  Text  currentText;
  Text  trueText;
  Text  falseText;

  SwitchModel(Icon icoTrue, Text txtTrue, Icon icoFalse, Text txtFalse)
  {
    trueIcon = icoTrue;
    trueText = txtTrue;
    falseIcon = icoFalse;
    falseText = txtFalse;

    currentValue = false;
    doSwitch(currentValue);
  }

  doSwitch(bool value)
  {
    currentValue = value;

    if(currentValue)
    {
      currentIcon = trueIcon;
      currentText = trueText;
    }
    else
    {
      currentIcon = falseIcon;
      currentText = falseText;
    }
  }

}