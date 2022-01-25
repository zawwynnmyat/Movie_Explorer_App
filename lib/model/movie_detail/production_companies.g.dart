// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) =>
    ProductionCompanies(
      json['name'] as String,
      json['id'] as int,
      json['logo_path'] as String?,
      json['origin_country'] as String,
    );

Map<String, dynamic> _$ProductionCompaniesToJson(
        ProductionCompanies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo_path': instance.logo_path,
      'origin_country': instance.origin_country,
    };
