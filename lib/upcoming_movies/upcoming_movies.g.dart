// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMovies _$UpcomingMoviesFromJson(Map<String, dynamic> json) =>
    UpcomingMovies(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      Dates.fromJson(json['dates'] as Map<String, dynamic>),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$UpcomingMoviesToJson(UpcomingMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
