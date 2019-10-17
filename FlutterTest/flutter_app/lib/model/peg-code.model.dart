

import 'dart:ui';
import 'peg.model.dart';
import '../utils/settings.utils.dart';

class CodePegModel extends PegModel {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  CodePegModel() {
    this.color = Settings.defaultColor;
  }

  CodePegModel.withColor(Color color)
  {
    this.color = color;
  }

  CodePegModel.withRandomColor()
  {
    this.color = Settings.getRandomColor();
  }

  void randomize() {
    this.color = Settings.getRandomColorDifferent(this.color);
  }

}