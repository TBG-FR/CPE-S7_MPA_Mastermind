

import 'dart:ui';
import 'peg.dart';
import 'settings.dart';

class CodePeg extends Peg {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  CodePeg() {
    this.color = Settings.defaultColor;
  }

  CodePeg.withColor(Color color)
  {
    this.color = color;
  }

  CodePeg.withRandomColor()
  {
    this.color = Settings.getRandomColor();
  }

  void randomize() {
    this.color = Settings.getRandomColorDifferent(this.color);
  }

}