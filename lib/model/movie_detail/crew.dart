import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  bool adult;
  int? gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  num popularity;
  String? profile_path;
  String credit_id;
  String department;
  String job;

  Crew(
      this.adult,
      this.gender,
      this.id,
      this.known_for_department,
      this.name,
      this.original_name,
      this.popularity,
      this.profile_path,
      this.credit_id,
      this.department,
      this.job
      );

  factory Crew.fromJson(Map<String, dynamic> parsedJson) => _$CrewFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}