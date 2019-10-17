
import 'dart:collection';
import 'dart:ui';
import 'package:flutter_app/model/peg-key.model.dart';
import '../utils/settings.utils.dart';
import 'enums/peg-key-type.enum.dart';
import 'peg-code.model.dart';

class CombinationModel extends ListBase<CodePegModel> {

  static int countTry = 0;
  CombinationModel()
  {
    for(int i=0; i<length; i++)
    {
      this[i] = new CodePegModel();  //file peg.code
    }
    countTry++;
  }

  CombinationModel.withRandomValues()
  {
    countTry = 0;
    for(int i=0; i<length; i++)
    {
      this[i] = new CodePegModel.withRandomColor();
    }
  }

  void editPeg(int position, Color setColor) {

    if(Settings.availableColors.contains(setColor))
    {
      if(this.elementAt(position) == null)
      {
        this[position] = new CodePegModel.withColor(setColor);
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
    for(CodePegModel cp in this)
    {
      if(cp.color == color)
      {
        return true;
      }
    }
    return false;
  }

  List<KeyPegModel> compare(CombinationModel tryCode)
  {
    // TODO : Fix bug with countTry
    print("Combinaison n° :" + countTry.toString() + "\n");
    print("Liste des couleurs " + "\n");
    List<KeyPegModel> result = List<KeyPegModel>(Settings.codeLength);

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

      result[i] = new KeyPegModel(cpResult);
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

  void operator[]=(int index, CodePegModel value) {
    innerList[index] = value;
  }

  CodePegModel operator [](int index) => innerList[index];

  // Though not strictly necessary, for performance reasons
  // you should implement add and addAll.

  void add(CodePegModel value) => innerList.add(value);

  void addAll(Iterable<CodePegModel> all) => innerList.addAll(all);




}