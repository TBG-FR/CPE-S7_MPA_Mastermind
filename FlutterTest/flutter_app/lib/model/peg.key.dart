
import 'peg.dart';
import 'package:flutter/material.dart';

enum KeyPegTypeEnum {
  WELL_PLACED,
  WRONG_POSITION,
  WRONG_PEG,
}

class KeyPeg extends Peg {

  KeyPegTypeEnum type;

  KeyPeg(type)
  {
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