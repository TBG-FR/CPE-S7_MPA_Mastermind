// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsModel _$ResultsModelFromJson(Map<String, dynamic> json) {
  return ResultsModel((json['results_list'] as List)
      ?.map((e) =>
          e == null ? null : ResultModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ResultsModelToJson(ResultsModel instance) =>
    <String, dynamic>{
      'results_list': instance.results?.map((e) => e?.toJson())?.toList()
    };
