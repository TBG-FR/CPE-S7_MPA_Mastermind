
import 'dart:ui';
import 'package:flutter_app/model/enums/result.enum.dart';

import 'combination.dart';
import 'peg.code.dart';
import 'peg.key.dart';
import 'settings.dart';
import 'try.dart';

class Result {

  //static final List<Color> availableColors  = new List<Color>(codeLength);
  Combination secretCode;// = new Combination();
  int numberOfTries;
  ResultEnum gameResult;

  Result(Combination code, int tries)
  {
    this.secretCode = code;
    this.numberOfTries = tries;
  }

  factory Result.abortedGame(Combination code, int tries)
  {
    Result resultInstance = Result(code, tries);
    resultInstance.gameResult = ResultEnum.aborted;
    return resultInstance;
  }

  factory Result.finishedGame(Combination code, int tries, ResultEnum result)
  {
    Result resultInstance = Result(code, tries);
    resultInstance.gameResult = result;
    return resultInstance;
  }

}