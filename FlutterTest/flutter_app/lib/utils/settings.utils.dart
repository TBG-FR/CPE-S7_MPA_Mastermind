
import 'dart:math';
import 'package:flutter/material.dart';

class Settings {

  static const int codeLengthMin = 4;
  static const int codeLengthMax = 8;

  static int codeLength = codeLengthMin;
  static int triesAllowed = 5;

//  static CodePegTypeEnum pegType = CodePegTypeEnum.COLORS;
//  static Type getCurrentPegType()
//  {
//    switch(pegType)
//    {
//      case CodePegTypeEnum.LETTERS:
//        return CodePegTypeLetterEnum;
//        break;
// /*
//      case CodePegTypeEnum.EMOJIS:
//        return CodePegTypeColorEnum;
//        break;
//*/
//      case CodePegTypeEnum.COLORS:
//      default:
//        return CodePegTypeColorEnum;
//        break;
//    }
//  }

  static const List<Color> availableColors  = [Colors.blue, Colors.red, Colors.green, Colors.yellow];
  static const Color defaultColor = Colors.blueGrey;
  static const double defaultSize = 50;
  static final Random random = new Random();

  // TODO : Move to Tools/Utils/Helper
  static Color getRandomColor()
  {
    int randomInt = random.nextInt(availableColors.length);

    return availableColors[randomInt];
  }

  // TODO : Move to Tools/Utils/Helper
  static Color getRandomColorDifferent(Color color)
  {
    Color returnColor;

    do { returnColor = getRandomColor(); }
    while(returnColor == color);

    return returnColor;
  }

  static Color getNextColor(Color color) {
    Color returnColor;
    int i;
    returnColor = availableColors[0];
    for(i=0;i<(availableColors.length-1);i++)
      {
        if(color == availableColors[i]) {
          returnColor = availableColors[i+1];
          break;
        }
      }
    return returnColor;
  }

}