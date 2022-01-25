import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/model/trendingmovieitem.dart';

part 'trendingmovie.g.dart';

@JsonSerializable()
class TrendingMovie {

  int page;
  List<TrendingMovieItem> results;
  int total_pages;
  int total_results;

  TrendingMovie(
       this.page,
      this.results,
      this.total_pages,
      this.total_results
      );
  factory TrendingMovie.fromJson(Map<String, dynamic> parsedJson) => _$TrendingMovieFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$TrendingMovieToJson(this);


}