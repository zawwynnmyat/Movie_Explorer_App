// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_episode_to_air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastEpisodeToAir _$LastEpisodeToAirFromJson(Map<String, dynamic> json) =>
    LastEpisodeToAir(
      json['air_date'] as String?,
      json['episode_number'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['overview'] as String?,
      json['production_code'] as String?,
      json['season_number'] as int?,
      json['still_path'] as String?,
      json['vote_average'] as num?,
      json['vote_count'] as int?,
    );

Map<String, dynamic> _$LastEpisodeToAirToJson(LastEpisodeToAir instance) =>
    <String, dynamic>{
      'air_date': instance.air_date,
      'episode_number': instance.episode_number,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.production_code,
      'season_number': instance.season_number,
      'still_path': instance.still_path,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
