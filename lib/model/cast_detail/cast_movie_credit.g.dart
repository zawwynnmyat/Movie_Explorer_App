// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_movie_credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMovieCredit _$CastMovieCreditFromJson(Map<String, dynamic> json) =>
    CastMovieCredit(
      json['id'] as int,
      (json['cast'] as List<dynamic>)
          .map((e) => CastMovieItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => CastCrewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastMovieCreditToJson(CastMovieCredit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
