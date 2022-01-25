// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastImages _$CastImagesFromJson(Map<String, dynamic> json) => CastImages(
      json['id'] as int,
      (json['profiles'] as List<dynamic>)
          .map((e) => Profiles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastImagesToJson(CastImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles,
    };
