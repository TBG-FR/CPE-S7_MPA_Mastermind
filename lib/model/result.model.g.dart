// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return ResultModel(
      json['secret_code'] == null
          ? null
          : CombinationModel.fromJson(
              json['secret_code'] as Map<String, dynamic>),
      json['number_tries'] as int,
      _$enumDecodeNullable(_$ResultEnumEnumMap, json['game_result']),
      json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String));
}

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'secret_code': instance.secretCode?.toJson(),
      'number_tries': instance.numberOfTries,
      'game_result': _$ResultEnumEnumMap[instance.gameResult],
      'date_time': instance.dateTime?.toIso8601String()
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$ResultEnumEnumMap = <ResultEnum, dynamic>{
  ResultEnum.won: 'won',
  ResultEnum.lost: 'lost',
  ResultEnum.aborted: 'aborted'
};
