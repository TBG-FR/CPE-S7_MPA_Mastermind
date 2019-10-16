
import 'dart:ui';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter/material.dart';

import 'combination.dart';
import 'peg.code.dart';
import 'peg.key.dart';
import 'result.model.dart';
import 'settings.dart';
import 'try.dart';
import 'dialog.dart';

class Mastermind {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  //static final List<Color> availableColors  = new List<Color>(codeLength);
  Combination secretCode;// = new Combination();
  List<Try> tries;

  Mastermind()
  {
    this.tries = new List<Try>();
    this.generateCode();
  }

  void editCode(int position, Color setColor)
  {
    secretCode.editPeg(position, setColor);
  }

  void generateCode()
  {
    secretCode = new Combination.withRandomValues();
  }

  void resetGame()
  {
    this.tries = new List<Try>();
    this.generateCode();
    tries.add(new Try());
  }

  void cancelGame(BuildContext context)
  {
    Result resultGame = this.endGame(ResultEnum.aborted);
  }

  void newTry()
  {
    tries.add(new Try());

  }

  Result checkLastTry()
  {
    bool won = true;
    tries.last.result = secretCode.compare(tries.last.tryCode);

    for(KeyPeg kp in tries.last.result)
    {
      if(kp.type != KeyPegTypeEnum.WELL_PLACED)
      {
        won = false;
      }
    }

    if(won)
    {
      return this.endGame(ResultEnum.won);
    }
    else if(tries.length > Settings.triesAllowed)
    {
      return this.endGame(ResultEnum.lost);
    }
    else
    {
      this.newTry();
      return null;
    }
  }

  Result endGame(ResultEnum result) {
    return new Result.finishedGame(
        this.secretCode,
        this.tries.length,
        result
    );
  }

//  void modifySecretCodePeg(int pegIndex)
//  {
//    _modifyCode(secretCode, pegIndex);
//  }
//
//  void modifyTryCodePeg(int pegIndex)
//  {
//    _modifyCode(tries.last.tryCode, pegIndex);
//  }

  static void modifyCode(Combination code, int pegIndex)
  {
    code[pegIndex].color = Settings.getNextColor(code[pegIndex].color);
  }

//  // TODO : Return an Enum value (see below)
//  KeyPegTypeEnum/*int*/ compareCodePeg(int position, Color triedColor) {
//
//    if(secretCode.elementAt(position).color == triedColor) {
//      //return 1;
//      return KeyPegTypeEnum.WELL_PLACED;
//    }
//    else { // TODO : if secretCode.any([...])
//
//      bool codeHasColor = false;
//
//      for(CodePeg cp in secretCode) {
//        if(cp.color == triedColor) {
//          codeHasColor = true;
//        }
//      }
//
//      if(codeHasColor)
//      {
//        //return 0;
//        return KeyPegTypeEnum.WRONG_POSITION;
//      }
//      else
//      {
//        //return -1;
//        return KeyPegTypeEnum.WRONG_PEG;
//      }
//    }
//
//  }
/*

*/
}