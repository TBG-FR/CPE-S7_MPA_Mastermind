
import 'enums/result.enum.dart';
import 'combination.model.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'result.model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)

class ResultModel {

  /// "secret_code" should be mapped 'secretCode' property.
  @JsonKey(name: 'secret_code')
  CombinationModel secretCode;

  /// "number_tries" should be mapped 'numberOfTries' property.
  @JsonKey(name: 'number_tries')
  int numberOfTries;

  /// "game_result" should be mapped 'gameResult' property.
  @JsonKey(name: 'game_result')
  ResultEnum gameResult;

  /// "date_time" should be mapped 'dateTime' property.
  @JsonKey(name: 'date_time')
  DateTime dateTime;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);

  // ============================================

  ResultModel(this.secretCode, this.numberOfTries, this.gameResult, this.dateTime);

  // ============================================

  factory ResultModel.abortedGame(CombinationModel code, int tries)
  {
    code.editable = false;
    return ResultModel(code, tries - 1, ResultEnum.aborted, DateTime.now());
  }

  factory ResultModel.finishedGame(CombinationModel code, int tries, ResultEnum result)
  {
    code.editable = false;
    return ResultModel(code, tries, result, DateTime.now());
  }

}