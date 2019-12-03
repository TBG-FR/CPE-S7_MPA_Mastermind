// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CombinationModel _$CombinationModelFromJson(Map<String, dynamic> json) {
  return CombinationModel()
    ..pegs = (json['pegs_list'] as List)
        ?.map((e) =>
            e == null ? null : CodePegModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..countTry = json['count_try'] as int
    ..pegAnalyse =
        (json['peg_analyse'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$CombinationModelToJson(CombinationModel instance) =>
    <String, dynamic>{
      'pegs_list': instance.pegs?.map((e) => e?.toJson())?.toList(),
      'count_try': instance.countTry,
      'peg_analyse': instance.pegAnalyse
    };
