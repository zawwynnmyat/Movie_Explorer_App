// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastDetail _$CastDetailFromJson(Map<String, dynamic> json) => CastDetail(
      json['birthday'] as String?,
      json['known_for_department'] as String?,
      json['deathday'] as String?,
      json['id'] as int,
      json['name'] as String,
      (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['gender'] as int,
      json['biography'] as String?,
      json['popularity'] as num,
      json['place_of_birth'] as String?,
      json['adult'] as bool,
      json['imdb_id'] as String?,
      json['homepage'] as String?,
    )..profile_path = json['profile_path'] as String?;

Map<String, dynamic> _$CastDetailToJson(CastDetail instance) =>
    <String, dynamic>{
      'birthday': instance.birthday,
      'known_for_department': instance.known_for_department,
      'deathday': instance.deathday,
      'id': instance.id,
      'name': instance.name,
      'also_known_as': instance.also_known_as,
      'gender': instance.gender,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'place_of_birth': instance.place_of_birth,
      'profile_path': instance.profile_path,
      'adult': instance.adult,
      'imdb_id': instance.imdb_id,
      'homepage': instance.homepage,
    };
