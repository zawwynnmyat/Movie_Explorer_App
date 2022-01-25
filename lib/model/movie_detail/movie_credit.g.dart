// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCredit _$MovieCreditFromJson(Map<String, dynamic> json) => MovieCredit(
      json['id'] as int,
      (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditToJson(MovieCredit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
