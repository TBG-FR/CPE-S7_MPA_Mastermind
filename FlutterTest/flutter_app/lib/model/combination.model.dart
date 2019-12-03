
import 'dart:collection';
import 'dart:ui';
import 'package:flutter_app/model/peg-key.model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../utils/settings.utils.dart';
import 'enums/peg-key-type.enum.dart';
import 'peg-code.model.dart';


/// This allows the `CombinationModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'combination.model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)

class CombinationModel //extends ListBase<CodePegModel>
{

  @JsonKey(ignore: true)
  bool editable = true;

  /// "pegs_list" should be mapped 'pegs' property.
  @JsonKey(name: 'pegs_list')
  List<CodePegModel> pegs = new List<CodePegModel>(Settings.codeLength);

  /// "count_try" should be mapped 'countTry' property.
  @JsonKey(name: 'count_try')
  int countTry = 0;

  /// "peg_analyse" should be mapped 'pegAnalyse' property.
  @JsonKey(name: 'peg_analyse')
  List<int> pegAnalyse = [];

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CombinationModel.fromJson(Map<String, dynamic> json) => _$CombinationModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CombinationModelToJson(this);

  // ============================================

//  CombinationModel(this.countTry, this.pegAnalyse);

  // ============================================

  CombinationModel()
  {
    for(int i=0; i<Settings.codeLength; i++)
    {
      this.pegs[i] = new CodePegModel();  //file peg.code
    }
  }

  CombinationModel.withRandomValues()
  {
    for(int i=0; i<Settings.codeLength; i++)
    {
      this.pegs[i] = new CodePegModel.withRandomColor();
    }
  }

  void editPeg(int position, Color setColor)
  {
    if(Settings.availableColors.contains(setColor))
    {
      if(this.pegs.elementAt(position) == null)
      {
        this.pegs[position] = new CodePegModel.withColor(setColor);
      }
      else
      {
        this.pegs.elementAt(position).color = setColor;
      }
    }
    else { /* do nothing */ }
  }

  // TODO : Count (X times the color Y => can't return that every time)
  bool hasColor(Color color)
  {
    int j = 0;
    bool isInList;
    for(CodePegModel cp in this.pegs)
      {
        isInList = pegAnalyse.indexOf(j) != -1;
      if(cp.color == color && isInList)
      {
        pegAnalyse.remove(j);
        return true;
      }
      j++;
    }
    return false;
  }

  List<KeyPegModel> compare(CombinationModel tryCode)
  {
    print("Liste des couleurs " + "\n");
    List<KeyPegModel> result = List<KeyPegModel>(Settings.codeLength);
    List<int> pegMissPlaced = [];

    int pegWellPlaced =0;
    int pegWrongPosition = 0;
    int pegWrong=0;
    for(int i=0; i<Settings.codeLength; i++)
    {
      if(this.pegs.elementAt(i).color == tryCode.pegs.elementAt(i).color)
      {
        print(i.toString() + " Bien placé ! ");
        pegWellPlaced++;
      }
      else
        {
          pegMissPlaced.add(i);
          pegAnalyse.add(i);
        }
    }
    for (int j in pegMissPlaced) {
      if(this.hasColor(tryCode.pegs.elementAt(j).color))
        {
          pegWrongPosition++;
          print(j.toString() + " Mal placé ! ");
        }
        else
        {
          pegWrong++;
          print(j.toString() + " Mauvais peg ! ");
        }
    }
    //pegWrong = Settings.codeLength - (pegWellPlaced+pegWrongPosition);
    for(int k=0;k<pegWellPlaced;k++) result[k] = new KeyPegModel(KeyPegTypeEnum.WELL_PLACED);
    for(int k=pegWellPlaced;k<(pegWellPlaced+pegWrongPosition);k++) result[k] = new KeyPegModel(KeyPegTypeEnum.WRONG_POSITION);
    for(int k=(pegWellPlaced+pegWrongPosition);k<(pegWrong+pegWellPlaced+pegWrongPosition);k++) result[k] = new KeyPegModel(KeyPegTypeEnum.WRONG_PEG);
    pegAnalyse.clear();
    return result;
  }

}