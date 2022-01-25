
import 'package:json_annotation/json_annotation.dart';

part 'trendingmovieitem.g.dart';

@JsonSerializable()
class TrendingMovieItem {
  String? poster_path;
  bool adult;
  String overview;
  num? vote_average;
  String release_date;
  List<int> genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String? backdrop_path;
  num? popularity;
  int vote_count;
  bool video;
  num? number;

  TrendingMovieItem(
      this.poster_path,
      this.adult,
      this.overview,
      this.vote_average,
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
      this.number
      );

  factory TrendingMovieItem.fromJson(Map<String, dynamic> parsedJson) => _$TrendingMovieItemFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$TrendingMovieItemToJson(this);
}