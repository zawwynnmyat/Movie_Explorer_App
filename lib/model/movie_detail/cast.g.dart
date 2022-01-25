// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      json['adult'] as bool,
      json['gender'] as int?,
      json['id'] as int,
      json['known_for_department'] as String,
      json['name'] as String,
      json['original_name'] as String,
      json['popularity'] as num,
      json['profile_path'] as String?,
      json['cast_id'] as int,
      json['character'] as String,
      json['credit_id'] as String,
      json['order'] as int,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'original_name': instance.original_name,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
      'cast_id': instance.cast_id,
      'character': instance.character,
      'credit_id': instance.credit_id,
      'order': instance.order,
    };
