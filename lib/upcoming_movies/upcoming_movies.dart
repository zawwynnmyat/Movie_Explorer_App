import 'package:json_annotation/json_annotation.dart';
import 'package:movie_finder/upcoming_movies/dates.dart';
import 'package:movie_finder/upcoming_movies/results.dart';

part 'upcoming_movies.g.dart';

@JsonSerializable()
class UpcomingMovies {
  int page;
  List<Results> results;
  Dates dates;
  int total_pages;
  int total_results;

  UpcomingMovies(
      this.page,
      this.results,
      this.dates,
      this.total_pages,
      this.total_results
      );

  factory UpcomingMovies.fromJson(Map<String, dynamic> parsedJson) => _$UpcomingMoviesFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$UpcomingMoviesToJson(this);
}