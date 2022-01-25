// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profiles _$ProfilesFromJson(Map<String, dynamic> json) => Profiles(
      json['aspect_ratio'] as num,
      json['file_path'] as String,
      json['height'] as int,
      json['iso_639_1'] as String?,
      json['vote_average'] as num,
      json['vote_count'] as int,
      json['width'] as int,
    );

Map<String, dynamic> _$ProfilesToJson(Profiles instance) => <String, dynamic>{
      'aspect_ratio': instance.aspect_ratio,
      'file_path': instance.file_path,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
      'width': instance.width,
    };
