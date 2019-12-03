

import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';

import 'extensions/color.extension.dart';
import 'peg.model.dart';
import '../utils/settings.utils.dart';

/// This allows the `CombinationModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'peg-code.model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)

class CodePegModel extends PegModel
{

  /// "pegs_list" should be mapped 'pegs' property.
  @JsonKey(name: "pegs", fromJson: ColorExtension.fromJson, toJson: ColorExtension.toJson)
//  @JsonKey(ignore: true)
  Color color;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CodePegModel.fromJson(Map<String, dynamic> json) => _$CodePegModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CodePegModelToJson(this);

  // TODO : Generalize (no more color but element (color, emoji, letter, ...) of a selected type

  CodePegModel()
  {
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

  void randomize()
  {
    this.color = Settings.getRandomColorDifferent(this.color);
  }

}