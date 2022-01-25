// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_tv_credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastTvCredit _$CastTvCreditFromJson(Map<String, dynamic> json) => CastTvCredit(
      json['id'] as int,
      (json['cast'] as List<dynamic>)
          .map((e) => CastTvItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => CastTvCrew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastTvCreditToJson(CastTvCredit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
