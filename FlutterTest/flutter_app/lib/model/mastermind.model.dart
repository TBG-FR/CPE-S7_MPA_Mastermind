
import 'dart:ui';
import 'package:flutter_app/model/enums/result.enum.dart';
import 'package:flutter/material.dart';

import 'combination.model.dart';
import 'enums/peg-key-type.enum.dart';
import 'peg-key.model.dart';
import 'result.model.dart';
import '../utils/settings.utils.dart';
import 'try.model.dart';

class MastermindModel {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  //static final List<Color> availableColors  = new List<Color>(codeLength);
  CombinationModel secretCode;// = new Combination();
  List<TryModel> tries;

  MastermindModel()
  {
    this.tries = new List<TryModel>();
    this.generateCode();
  }

  void editCode(int position, Color setColor)
  {
    secretCode.editPeg(position, setColor);
  }

  void generateCode()
  {
    secretCode = new CombinationModel.withRandomValues();
  }

  void resetGame()
  {
    this.tries = new List<TryModel>();
    this.generateCode();
    tries.add(new TryModel());
  }

  void newTry()
  {
    tries.add(new TryModel());

  }

  ResultModel checkLastTry()
  {
    bool won = true;
    tries.last.result = secretCode.compare(tries.last.tryCode);

    for(KeyPegModel kp in tries.last.result)
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

  ResultModel endGame(ResultEnum result)
  {
    if(result == ResultEnum.aborted)
    {
      return new ResultModel.abortedGame(
          this.secretCode,
          this.tries.length,
      );
    }
    else
    {
      return new ResultModel.finishedGame(
          this.secretCode,
          this.tries.length,
          result,
      );
    }
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

  static void modifyCode(CombinationModel code, int pegIndex)
  {
    code.pegs[pegIndex].color = Settings.getNextColor(code.pegs[pegIndex].color);
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