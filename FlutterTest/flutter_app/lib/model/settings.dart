
import 'dart:math';
import 'package:flutter/material.dart';

class Settings {

  static final int codeLength = 4;
  static final List<Color> availableColors  = [Colors.blue, Colors.red, Colors.green, Colors.yellow];
  static final Color defaultColor = Colors.blueGrey;
  static final Random random = new Random();

  static Color getRandomColor()
  {
    int randomInt = random.nextInt(codeLength);

    return availableColors[randomInt];
  }

  static Color getRandomColorDifferent(Color color)
  {
    Color returnColor;

    do { returnColor = getRandomColor(); }
    while(returnColor == color);

    return returnColor;
  }

}