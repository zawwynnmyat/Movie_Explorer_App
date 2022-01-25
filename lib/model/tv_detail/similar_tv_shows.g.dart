// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_tv_shows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarTvShows _$SimilarTvShowsFromJson(Map<String, dynamic> json) =>
    SimilarTvShows(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => SimilarTvItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int,
      json['total_results'] as int,
    );

Map<String, dynamic> _$SimilarTvShowsToJson(SimilarTvShows instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
