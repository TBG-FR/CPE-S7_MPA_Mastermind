
import 'dart:math';
import 'dart:developer' as developer;
import 'dart:ui';
import 'combination.dart';
import 'peg.key.dart';
import 'settings.dart';
import 'try.dart';

class Mastermind {

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  //static final List<Color> availableColors  = new List<Color>(codeLength);
  Combination secretCode;// = new Combination();
  List<Try> tries = new List<Try>();

  Mastermind()
  {
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

  void newTry()
  {
    tries.add(new Try());
  }

  void checkLastTry()
  {
    tries.last.result = secretCode.compare(tries.last.tryCode);
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
    code[pegIndex].color = Settings.getRandomColorDifferent(code[pegIndex].color);
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

//  List<KeyPeg> compareSecretCode(List<CodePeg> triedSecretCode) {
//
//    List<KeyPeg> result = List<KeyPeg>(Settings.codeLength);
//
//    for(int i=0; i<Settings.codeLength; i++)
//    {
//      result[i] = new KeyPeg(compareCodePeg(i, triedSecretCode.elementAt(i).color));
//    }
//
//    return result;
//
//  }

}