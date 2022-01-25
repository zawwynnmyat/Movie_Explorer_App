// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_tv_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastTvCrew _$CastTvCrewFromJson(Map<String, dynamic> json) => CastTvCrew(
      json['id'] as int?,
      json['department'] as String?,
      json['original_language'] as String?,
      json['episode_count'] as int?,
      json['job'] as String?,
      json['overview'] as String?,
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['original_name'] as String?,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['name'] as String?,
      json['first_air_date'] as String?,
      json['backdrop_path'] as String?,
      json['popularity'] as num?,
      json['vote_count'] as int?,
      json['vote_average'] as num?,
      json['poster_path'] as String?,
      json['credit_id'] as String?,
    );

Map<String, dynamic> _$CastTvCrewToJson(CastTvCrew instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'original_language': instance.original_language,
      'episode_count': instance.episode_count,
      'job': instance.job,
      'overview': instance.overview,
      'origin_country': instance.origin_country,
      'original_name': instance.original_name,
      'genre_ids': instance.genre_ids,
      'name': instance.name,
      'first_air_date': instance.first_air_date,
      'backdrop_path': instance.backdrop_path,
      'popularity': instance.popularity,
      'vote_count': instance.vote_count,
      'vote_average': instance.vote_average,
      'poster_path': instance.poster_path,
      'credit_id': instance.credit_id,
    };
