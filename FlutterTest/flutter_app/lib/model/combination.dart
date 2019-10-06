
import 'dart:collection';
import 'dart:ui';
import 'package:flutter_app/model/peg.key.dart';
import 'settings.dart';
import 'peg.code.dart';

class Combination extends ListBase<CodePeg> {

  static int countTry = 0;
  Combination()
  {
    for(int i=0; i<length; i++)
    {
      this[i] = new CodePeg();  //file peg.code
    }
    countTry++;
  }

  Combination.withRandomValues()
  {
    countTry = 0;
    for(int i=0; i<length; i++)
    {
      this[i] = new CodePeg.withRandomColor();
    }
  }

  void editPeg(int position, Color setColor) {

    if(Settings.availableColors.contains(setColor))
    {
      if(this.elementAt(position) == null)
      {
        this[position] = new CodePeg.withColor(setColor);
      }
      else
      {
        this.elementAt(position).color = setColor;
      }
    }
    else { /* do nothing */ }
  }

  // TODO : Count (X times the color Y => can't return that every time)
  bool hasColor(Color color)
  {
    for(CodePeg cp in this)
    {
      if(cp.color == color)
      {
        return true;
      }
    }
    return false;
  }

  List<KeyPeg> compare(Combination tryCode)
  {
    // TODO : Fix bug with countTry
    print("Combinaison n° :" + countTry.toString() + "\n");
    print("Liste des couleurs " + "\n");
    List<KeyPeg> result = List<KeyPeg>(Settings.codeLength);

    for(int i=0; i<Settings.codeLength; i++)
    {
      KeyPegTypeEnum cpResult;

      if(this.elementAt(i).color == tryCode.elementAt(i).color)
      {
        print(i.toString() + " Bien placé ! ");
        cpResult = KeyPegTypeEnum.WELL_PLACED;
      }
      else
      {
        if(this.hasColor(tryCode.elementAt(i).color))
        {
          // TODO : Count (X times the color Y => can't return that every time)
          print(i.toString() + " Mal placé ! ");

          cpResult = KeyPegTypeEnum.WRONG_POSITION;
        }
        else
        {
          print(i.toString() + " Mauvais peg ! ");

          cpResult = KeyPegTypeEnum.WRONG_PEG;
        }
      }

      result[i] = new KeyPeg(cpResult);
    }

    return result;
  }

  // ------------------------------------------------------------------------
  // ------------------------------------------------------------------------
  // ------------------------------------------------------------------------

  List innerList = new List(Settings.codeLength);

  int get length => innerList.length;

  /// WARNING : Useless
  set length(int length) {
    //innerList.length = length;
  }

  void operator[]=(int index, CodePeg value) {
    innerList[index] = value;
  }

  CodePeg operator [](int index) => innerList[index];

  // Though not strictly necessary, for performance reasons
  // you should implement add and addAll.

  void add(CodePeg value) => innerList.add(value);

  void addAll(Iterable<CodePeg> all) => innerList.addAll(all);




}