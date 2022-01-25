// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMovieItem _$CastMovieItemFromJson(Map<String, dynamic> json) =>
    CastMovieItem(
      json['character'] as String?,
      json['credit_id'] as String?,
      json['release_date'] as String?,
      json['vote_count'] as int,
      json['video'] as bool,
      json['adult'] as bool,
      json['vote_average'] as num,
      json['title'] as String?,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['popularity'] as num,
      json['id'] as int,
      json['backdrop_path'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
      json['order'] as num?,
    );

Map<String, dynamic> _$CastMovieItemToJson(CastMovieItem instance) =>
    <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.credit_id,
      'release_date': instance.release_date,
      'vote_count': instance.vote_count,
      'video': instance.video,
      'adult': instance.adult,
      'vote_average': instance.vote_average,
      'title': instance.title,
      'genre_ids': instance.genre_ids,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'popularity': instance.popularity,
      'id': instance.id,
      'backdrop_path': instance.backdrop_path,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'order': instance.order,
    };
