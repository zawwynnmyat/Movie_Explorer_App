// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_tv_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastTvItem _$CastTvItemFromJson(Map<String, dynamic> json) => CastTvItem(
      json['credit_id'] as String?,
      json['original_name'] as String?,
      json['id'] as int?,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['character'] as String?,
      json['name'] as String?,
      json['poster_path'] as String?,
      json['vote_count'] as int?,
      json['vote_average'] as num?,
      json['popularity'] as num?,
      json['episode_count'] as int?,
      json['original_language'] as String?,
      json['first_air_date'] as String?,
      json['backdrop_path'] as String?,
      json['overview'] as String?,
      (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CastTvItemToJson(CastTvItem instance) =>
    <String, dynamic>{
      'credit_id': instance.credit_id,
      'original_name': instance.original_name,
      'id': instance.id,
      'genre_ids': instance.genre_ids,
      'character': instance.character,
      'name': instance.name,
      'poster_path': instance.poster_path,
      'vote_count': instance.vote_count,
      'vote_average': instance.vote_average,
      'popularity': instance.popularity,
      'episode_count': instance.episode_count,
      'original_language': instance.original_language,
      'first_air_date': instance.first_air_date,
      'backdrop_path': instance.backdrop_path,
      'overview': instance.overview,
      'origin_country': instance.origin_country,
    };
