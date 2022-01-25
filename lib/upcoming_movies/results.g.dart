// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      json['poster_path'] as String?,
      json['adult'] as bool?,
      json['overview'] as String?,
      json['release_date'] as String?,
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['id'] as int?,
      json['original_title'] as String?,
      json['original_language'] as String?,
      json['title'] as String?,
      json['backdrop_path'] as String?,
      json['popularity'] as num?,
      json['vote_count'] as int?,
      json['video'] as bool?,
      json['vote_average'] as num?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'poster_path': instance.poster_path,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'genre_ids': instance.genre_ids,
      'id': instance.id,
      'original_title': instance.original_title,
      'original_language': instance.original_language,
      'title': instance.title,
      'backdrop_path': instance.backdrop_path,
      'popularity': instance.popularity,
      'vote_count': instance.vote_count,
      'video': instance.video,
      'vote_average': instance.vote_average,
    };
