// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_crew_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastCrewItem _$CastCrewItemFromJson(Map<String, dynamic> json) => CastCrewItem(
      json['id'] as int,
      json['department'] as String?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['job'] as String?,
      json['overview'] as String?,
      json['vote_count'] as int,
      json['video'] as bool,
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
      json['title'] as String?,
      json['popularity'] as num,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['vote_average'] as num,
      json['adult'] as bool,
      json['release_date'] as String?,
      json['credit_id'] as String?,
    );

Map<String, dynamic> _$CastCrewItemToJson(CastCrewItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'job': instance.job,
      'overview': instance.overview,
      'vote_count': instance.vote_count,
      'video': instance.video,
      'poster_path': instance.poster_path,
      'backdrop_path': instance.backdrop_path,
      'title': instance.title,
      'popularity': instance.popularity,
      'genre_ids': instance.genre_ids,
      'vote_average': instance.vote_average,
      'adult': instance.adult,
      'release_date': instance.release_date,
      'credit_id': instance.credit_id,
    };
