//
//import 'dart:collection';
//import 'dart:ui';
//import 'package:flutter_app/model/peg-key.model.dart';
//import 'package:json_annotation/json_annotation.dart';
//import '../utils/settings.utils.dart';
//import 'enums/peg-key-type.enum.dart';
//import 'peg-code.model.dart';
//
//
//class CombinationModel extends ListBase<CodePegModel>
//{
//
//  int countTry = 0;
//
//  List<int> pegAnalyse = [];
//
//  CombinationModel()
//  {
//    for(int i=0; i<length; i++)
//    {
//      this[i] = new CodePegModel();  //file peg.code
//    }
//  }
//
//  CombinationModel.withRandomValues()
//  {
//    for(int i=0; i<length; i++)
//    {
//      this[i] = new CodePegModel.withRandomColor();
//    }
//  }
//
//  void editPeg(int position, Color setColor)
//  {
//    if(Settings.availableColors.contains(setColor))
//    {
//      if(this.elementAt(position) == null)
//      {
//        this[position] = new CodePegModel.withColor(setColor);
//      }
//      else
//      {
//        this.elementAt(position).color = setColor;
//      }
//    }
//    else { /* do nothing */ }
//  }
//
//  // TODO : Count (X times the color Y => can't return that every time)
//  bool hasColor(Color color)
//  {
//    int j = 0;
//    bool isInList;
//    for(CodePegModel cp in this)
//      {
//        isInList = pegAnalyse.indexOf(j) != -1;
//      if(cp.color == color && isInList)
//      {
//        pegAnalyse.remove(j);
//        return true;
//      }
//      j++;
//    }
//    return false;
//  }
//
//  List<KeyPegModel> compare(CombinationModel tryCode)
//  {
//    print("Liste des couleurs " + "\n");
//    List<KeyPegModel> result = List<KeyPegModel>(Settings.codeLength);
//    List<int> pegMissPlaced = [];
//
//    int pegWellPlaced =0;
//    int pegWrongPosition = 0;
//    int pegWrong=0;
//    for(int i=0; i<Settings.codeLength; i++)
//    {
//      if(this.elementAt(i).color == tryCode.elementAt(i).color)
//      {
//        print(i.toString() + " Bien placé ! ");
//        pegWellPlaced++;
//      }
//      else
//        {
//          pegMissPlaced.add(i);
//          pegAnalyse.add(i);
//        }
//    }
//    for (int j in pegMissPlaced) {
//      if(this.hasColor(tryCode.elementAt(j).color))
//        {
//          pegWrongPosition++;
//          print(j.toString() + " Mal placé ! ");
//        }
//        else
//        {
//          pegWrong++;
//          print(j.toString() + " Mauvais peg ! ");
//        }
//    }
//    //pegWrong = Settings.codeLength - (pegWellPlaced+pegWrongPosition);
//    for(int k=0;k<pegWellPlaced;k++) result[k] = new KeyPegModel(KeyPegTypeEnum.WELL_PLACED);
//    for(int k=pegWellPlaced;k<(pegWellPlaced+pegWrongPosition);k++) result[k] = new KeyPegModel(KeyPegTypeEnum.WRONG_POSITION);
//    for(int k=(pegWellPlaced+pegWrongPosition);k<(pegWrong+pegWellPlaced+pegWrongPosition);k++) result[k] = new KeyPegModel(KeyPegTypeEnum.WRONG_PEG);
//    pegAnalyse.clear();
//    return result;
//  }
//
//  // ------------------------------------------------------------------------
//  // ------------------------------------------------------------------------
//  // ------------------------------------------------------------------------
//
//  List innerList = new List(Settings.codeLength);
//
//  int get length => innerList.length;
//
//  /// WARNING : Useless
//  set length(int length) {
//    //innerList.length = length;
//  }
//
//  void operator[]=(int index, CodePegModel value) {
//    innerList[index] = value;
//  }
//
//  CodePegModel operator [](int index) => innerList[index];
//
//  // Though not strictly necessary, for performance reasons
//  // you should implement add and addAll.
//
//  void add(CodePegModel value) => innerList.add(value);
//
//  void addAll(Iterable<CodePegModel> all) => innerList.addAll(all);
//
//}