import 'package:json_annotation/json_annotation.dart';

part 'production_companies.g.dart';

@JsonSerializable()
class ProductionCompanies {
  String name;
  int id;
  String? logo_path;
  String origin_country;

  ProductionCompanies(this.name, this.id, this.logo_path, this.origin_country);

  factory ProductionCompanies.fromJson(Map<String, dynamic> parsedJson) => _$ProductionCompaniesFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);

}