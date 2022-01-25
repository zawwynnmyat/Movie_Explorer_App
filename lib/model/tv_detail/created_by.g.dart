// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      json['id'] as int?,
      json['credit_id'] as String?,
      json['name'] as String?,
      json['gender'] as int?,
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.credit_id,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.profile_path,
    };
