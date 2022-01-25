import 'package:json_annotation/json_annotation.dart';

part 'cast_crew_item.g.dart';

@JsonSerializable()
class CastCrewItem {
  int id;
  String? department;
  String? original_language;
  String? original_title;
  String? job;
  String? overview;
  int vote_count;
  bool video;
  String? poster_path;
  String? backdrop_path;
  String? title;
  num popularity;
  List<int> genre_ids;
  num vote_average;
  bool adult;
  String? release_date;
  String? credit_id;

  CastCrewItem(
      this.id,
      this.department,
      this.original_language,
      this.original_title,
      this.job,
      this.overview,
      this.vote_count,
      this.video,
      this.poster_path,
      this.backdrop_path,
      this.title,
      this.popularity,
      this.genre_ids,
      this.vote_average,
      this.adult,
      this.release_date,
      this.credit_id
      );

  factory CastCrewItem.fromJson(Map<String, dynamic> json) => _$CastCrewItemFromJson(json);
  Map<String, dynamic> toJson() => _$CastCrewItemToJson(this);
}