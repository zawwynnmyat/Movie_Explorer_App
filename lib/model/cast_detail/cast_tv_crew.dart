import 'package:json_annotation/json_annotation.dart';

part 'cast_tv_crew.g.dart';

@JsonSerializable()
class CastTvCrew {
  int? id;
  String? department;
  String? original_language;
  int? episode_count;
  String? job;
  String? overview;
  List<String>? origin_country;
  String? original_name;
  List<int> genre_ids;
  String? name;
  String? first_air_date;
  String? backdrop_path;
  num? popularity;
  int? vote_count;
  num? vote_average;
  String? poster_path;
  String? credit_id;

  CastTvCrew(
      this.id,
      this.department,
      this.original_language,
      this.episode_count,
      this.job,
      this.overview,
      this.origin_country,
      this.original_name,
      this.genre_ids,
      this.name,
      this.first_air_date,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      this.vote_average,
      this.poster_path,
      this.credit_id
      );

  factory CastTvCrew.fromJson(Map<String, dynamic> parsedJson) => _$CastTvCrewFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$CastTvCrewToJson(this);
}