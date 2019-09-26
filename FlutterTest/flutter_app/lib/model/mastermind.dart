
import 'package:flutter/material.dart';

class Mastermind {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  static final int codeLength = 4;
  //final List<Color> availableColors  = [Colors.blue, Colors.red, Colors.green, Colors.yellow];
  final List<Color> availableColors  = new List<Color>(codeLength);
  List<CodePeg> secretCode = new List<CodePeg>(codeLength);

  Mastermind() {
    availableColors[0] = Colors.blue;
    availableColors[1] = Colors.red;
    availableColors[2] = Colors.green;
    availableColors[3] = Colors.yellow;

  }

  void editCode(int position, Color setColor) {

    if(availableColors.contains(setColor))
    {
      if(secretCode.elementAt(position) == null)
      {
        secretCode[position] = new CodePeg.withColor(setColor);
      }
      else
      {
        secretCode.elementAt(position).color = setColor;
      }
    }
    else { /* do nothing */ }
  }

  // TODO : Return an Enum value (see below)
  KeyPegTypeEnum/*int*/ compareCodePeg(int position, Color triedColor) {

    if(secretCode.elementAt(position).color == triedColor) {
      //return 1;
      return KeyPegTypeEnum.WELL_PLACED;
    }
    else { // TODO : if secretCode.any([...])

      bool codeHasColor = false;

      for(CodePeg cp in secretCode) {
        if(cp.color == triedColor) {
          codeHasColor = true;
        }
      }

      if(codeHasColor)
      {
        //return 0;
        return KeyPegTypeEnum.WRONG_POSITION;
      }
      else
      {
        //return -1;
        return KeyPegTypeEnum.WRONG_PEG;
      }
    }

  }

  List<KeyPeg> compareSecretCode(List<CodePeg> triedSecretCode) {

    List<KeyPeg> result = List<KeyPeg>(codeLength);

    for(int i=0; i<codeLength; i++)
    {
      result[i] = new KeyPeg(compareCodePeg(i, triedSecretCode.elementAt(i).color));
    }

    return result;

  }

}

abstract class Peg
{
  Color color;
}

class CodePeg extends Peg {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  CodePeg() {
    color = Colors.blue;
  }

  CodePeg.withColor(Color color) {
    this.color = color;
  }

}

class KeyPeg extends Peg {

  KeyPegTypeEnum type;

  KeyPeg(type) {
    this.type = type;
  }

  // TODO : Move to "view", handle only type
  @override
  Color get color {

    switch(type) {
      case KeyPegTypeEnum.WELL_PLACED:
        return Colors.black;
        break;

      case KeyPegTypeEnum.WRONG_POSITION:
        return Colors.white;
        break;

      case KeyPegTypeEnum.WRONG_PEG:
      default:
        return Colors.grey;
        break;
    }
  }

}

enum KeyPegTypeEnum {
  WELL_PLACED,
  WRONG_POSITION,
  WRONG_PEG,
}