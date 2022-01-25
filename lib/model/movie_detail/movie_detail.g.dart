// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      json['adult'] as bool,
      json['backdrop_path'] as String?,
      json['belongs_to_collection'],
      json['budget'] as int,
      (json['genres'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['homepage'] as String?,
      json['id'] as int,
      json['imdb_id'] as String?,
      json['original_language'] as String,
      json['original_title'] as String,
      json['overview'] as String?,
      json['popularity'] as num,
      json['poster_path'] as String?,
      (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] as String,
      json['revenue'] as int,
      json['runtime'] as int?,
      (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String,
      json['tagline'] as String?,
      json['title'] as String,
      json['video'] as bool,
      json['vote_average'] as num,
      json['vote_count'] as int,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'belongs_to_collection': instance.belongs_to_collection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdb_id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'production_companies': instance.production_companies,
      'production_countries': instance.production_countries,
      'release_date': instance.release_date,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spoken_languages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
