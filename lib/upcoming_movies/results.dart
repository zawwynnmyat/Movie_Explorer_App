import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  String? poster_path;
  bool? adult;
  String? overview;
  String? release_date;
  List<int> genre_ids;
  int? id;
  String? original_title;
  String? original_language;
  String? title;
  String? backdrop_path;
  num? popularity;
  int? vote_count;
  bool? video;
  num? vote_average;

  Results(
      this.poster_path,
      this.adult,
      this.overview,
      this.release_date,
      this.genre_ids,
      this.id,
      this.original_title,
      this.original_language,
      this.title,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      this.video,
      this.vote_average
      );

  factory Results.fromJson(Map<String, dynamic> parsedJson) => _$ResultsFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}