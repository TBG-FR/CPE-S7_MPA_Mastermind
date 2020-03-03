// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peg-code.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodePegModel _$CodePegModelFromJson(Map<String, dynamic> json) {
  return CodePegModel()
    ..color = json['pegs'] == null
        ? null
        : ColorExtension.fromJson(json['pegs'] as String);
}

Map<String, dynamic> _$CodePegModelToJson(CodePegModel instance) =>
    <String, dynamic>{
      'pegs':
          instance.color == null ? null : ColorExtension.toJson(instance.color)
    };
