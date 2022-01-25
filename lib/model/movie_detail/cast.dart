import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  bool adult;
  int? gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  num popularity;
  String? profile_path;
  int cast_id;
  String character;
  String credit_id;
  int order;

  Cast(
      this.adult,
      this.gender,
      this.id,
      this.known_for_department,
      this.name,
      this.original_name,
      this.popularity,
      this.profile_path,
      this.cast_id,
      this.character,
      this.credit_id,
      this.order
      );

  factory Cast.fromJson(Map<String, dynamic> parsedJson) => _$CastFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CastToJson(this);

}