
import 'enums/peg-key-type.enum.dart';
import 'peg.model.dart';
import 'package:flutter/material.dart';

class KeyPegModel extends PegModel {

  KeyPegTypeEnum type;

  KeyPegModel(type)
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